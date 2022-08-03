import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/chat_room.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'chatroom_event.dart';
part 'chatroom_state.dart';

class ChatroomBloc extends Bloc<ChatroomEvent, ChatroomState> {
  final BaseHttpService _baseHttpService = BaseHttpService();
  ChatroomBloc() : super(ChatroomInitial()) {
    on<GetChatRooms>((event, emit) async {
      await _loadData(event, emit);
    });
    on<ChatroomEvent>((event, emit) {});
  }

  Future<void> _loadData(
      GetChatRooms event, Emitter<ChatroomState> emit) async {
    try {
      emit(state.copyWith(status: ChatRoomStatus.loading));
      http.Response? response =
          await _baseHttpService.get(url: ApiEndPoints.chatRoom);
      print(ApiEndPoints.chatRoom);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response.body);
          dynamic result = jsonDecode(response.body);
          List<ChatRoom> chatRooms = [];
          for (dynamic json in result) {
            chatRooms.add(ChatRoom.fromJson(json));
          }

          emit(state.copyWith(
              status: ChatRoomStatus.success, chatRooms: chatRooms));
        } else {
          emit(state.copyWith(status: ChatRoomStatus.failure));
        }
      } else {
        emit(
          state.copyWith(
            status: ChatRoomStatus.failure,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: ChatRoomStatus.failure));
    }
  }
}
