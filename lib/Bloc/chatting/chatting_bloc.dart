import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/chatting.dart';
import 'package:dating_app/mqtt.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mqtt_client/mqtt_client.dart';

import '../../Core/base/api_end_point.dart';

part 'chatting_event.dart';
part 'chatting_state.dart';

class ChattingBloc extends Bloc<ChattingEvent, ChattingState> {
  final BaseHttpService _baseHttpService = BaseHttpService();
  final Mqtt _mqtt = Mqtt();
  ChattingBloc() : super(ChattingInitial()) {
    Mqtt.client.updates!.listen((event) {
      try {
        final recMess = event[0].payload as MqttPublishMessage;
        final pt = utf8.decode(recMess.payload.message).toString();
        var result = jsonDecode(pt);
        Chatting chatting = Chatting.fromJson(result);
        Map<String, List<Chatting>> roomMessages = state.chatting;
        roomMessages[chatting.room] =
            (roomMessages[chatting.room] ?? []).reversed.toList();
        roomMessages[chatting.room]?.add(chatting);
        roomMessages[chatting.room] =
            (roomMessages[chatting.room] ?? []).reversed.toList();
        add(UpdateIncomingMessage(roomMessages: roomMessages));
      } catch (e) {
        print(e);
        print('****mqtt***');
      }
    });
    on<UpdateIncomingMessage>((event, emit) async {
      //print(event.roomMessages["61dec1099ceafed305d738f9"]?.last);
      await _updateIncomingMessage(event, emit);
    });
    on<GetMessages>((event, emit) async {
      await _getMessage(event, emit);
    });
    on<SubscribeRoom>((event, emit) async {
      await _subscribeRoom(event, emit);
    });
    on<RemoveSubscribedRoom>((event, emit) async {
      await _removeSubscribedRoom(event, emit);
    });

    on<PublishMessage>((event, emit) async {
      await _publishMessage(event, emit);
    });
    on<ChattingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  _updateIncomingMessage(
      UpdateIncomingMessage event, Emitter<ChattingState> emit) async {
    emit(state.copyWith(
        chatting: event.roomMessages, status: ChattingStatus.success));
  }

  _getMessage(GetMessages event, Emitter<ChattingState> emit) async {
    try {
      emit(state.copyWith(status: ChattingStatus.loading));
      if (state.chatting[event.roomId] != null) {
        emit(state.copyWith(status: ChattingStatus.success));
      }
      Response? response = await _baseHttpService.get(
          url: "${ApiEndPoints.message}${event.roomId}");
      if (response != null) {
        if (response.statusCode == 200) {
          List<dynamic> result = jsonDecode(response.body);
          Map<String, List<Chatting>> roomMessages = {};
          List<Chatting> messages = [];

          for (var json in result) {
            messages.add(Chatting.fromJson(json));
          }
          // print((json as List).length);
          state.chatting.forEach((key, value) {
            roomMessages.putIfAbsent(key, () => value);
          });
          roomMessages.update(
              event.roomId, (value) => messages.reversed.toList(),
              ifAbsent: () => messages.reversed.toList());
          emit(state.copyWith(
              status: ChattingStatus.success, chatting: roomMessages));
        } else {
          emit(state.copyWith(status: ChattingStatus.failure));
        }
      } else {
        emit(state.copyWith(status: ChattingStatus.failure));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: ChattingStatus.failure));
    }
  }

  _subscribeRoom(SubscribeRoom event, Emitter<ChattingState> emit) async {
    try {
      if (Mqtt.client.connectionStatus != null &&
          (Mqtt.client.connectionStatus?.state ==
              MqttConnectionState.disconnected)) {
        await _mqttConnect();
      }
      _mqttSubscribe(event.roomId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // _setListenerObserver(
  //     SetListenerObserver event, Emitter<MessageState> emit) async {
  //   try {
  // Mqtt.client.updates!.listen((event) {
  //   print(event.length);
  //   print("************");
  //   final recMess = event[0].payload as MqttPublishMessage;
  //   final pt =
  //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   var result = jsonDecode(pt);
  //   print(result);
  //   Message message = Message.fromJson(result);
  //   Map<String, List<Message>> roomMessages = state.messages;
  //   roomMessages[message.room] = roomMessages[message.room] ?? [];
  //   roomMessages[message.room]?.add(message);
  //   print(
  //       'EXAMPLE::Change notification:: topic is <${event[0].topic}>, payload is <-- ${pt.toString()} -->');
  //   print('');
  //   print("************");
  //   emit(state.copyWith(messages: roomMessages));
  // });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  _removeSubscribedRoom(
      RemoveSubscribedRoom event, Emitter<ChattingState> emit) async {
    try {
      if (Mqtt.client.subscriptionsManager != null) {
        Mqtt.client.subscriptionsManager?.unsubscribe(event.roomId);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _publishMessage(PublishMessage event, Emitter<ChattingState> emit) async {
    if (Mqtt.client.connectionStatus != null &&
        Mqtt.client.connectionStatus?.state != MqttConnectionState.connected) {
      await _mqttConnect();
    }
    try {
      Mqtt.client.publishMessage(
          event.roomId, MqttQos.exactlyOnce, event.builder.payload!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _mqttSubscribe(String roomId) async {
    Mqtt.client.subscribe(roomId, MqttQos.atLeastOnce);
  }

  _mqttConnect() async {
    await _mqtt.connect();
    if (kDebugMode) {
      print("Client is Connected");
    }
  }
}
