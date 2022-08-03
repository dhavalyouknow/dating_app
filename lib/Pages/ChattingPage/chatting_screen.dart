import 'dart:convert';
import 'package:dating_app/Bloc/chatting/chatting_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/chat_room.dart';
import 'package:dating_app/Model/participant.dart';
import 'package:dating_app/mqtt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'ChatScreen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message = TextEditingController();
  late ChatRoom chatRoom;
  Mqtt mqttInstance = Mqtt();
  String userId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatRoom = ModalRoute.of(context)?.settings.arguments as ChatRoom;
    loadMessage();
  }

  loadMessage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getString("user_id") ?? "";

    Future.delayed(const Duration(seconds: 0), () {
      BlocProvider.of<ChattingBloc>(context, listen: false)
          .add(GetMessages(roomId: chatRoom.id));

      BlocProvider.of<ChattingBloc>(context, listen: false)
          .add(SubscribeRoom(roomId: chatRoom.id));
    });

    setState(() {});
  }

  publishMessage(String msg) {
    print(msg);
    if (message.text.trim().isEmpty) {
      return;
    }

    Map<String, dynamic> data = {"type": "MESSAGE", "message": message.text};
    final msgBuilder = MqttClientPayloadBuilder();
    msgBuilder.addUTF8String(jsonEncode(data));
    // Mqtt.client
    //     .publishMessage(chatRoom.id, MqttQos.exactlyOnce, msgBuilder.payload!);

    BlocProvider.of<ChattingBloc>(context, listen: false)
        .add(PublishMessage(roomId: chatRoom.id, builder: msgBuilder));
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    message.clear();
  }

  String getChatRoomTitle(ChatRoom chatRoom) {
    if (userId.isEmpty) {
      return "";
    }
    if (chatRoom.title.isNotEmpty) {
      return chatRoom.title;
    }
    for (Participant participant in chatRoom.participants) {
      if (participant.id != userId) {
        if (kDebugMode) {
          print("===============");
          print(participant.id);
          print(userId);
          print("===============");
        }

        return "${participant.firstName} ${participant.lastName}";
      }
    }
    return "";
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    chatRoom = ModalRoute.of(context)?.settings.arguments as ChatRoom;
    if (kDebugMode) {
      print(chatRoom.participants);
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppStyles.introGradientColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppStyles.blackColor),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            getChatRoomTitle(chatRoom),
            style: const TextStyle(color: AppStyles.blackColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChattingBloc, ChattingState>(
                builder: (context, state) {
                  if (state.status == ChattingStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: (state.chatting[chatRoom.id] ?? []).length,
                    addAutomaticKeepAlives: true,
                    reverse: true,
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment:
                            state.chatting[chatRoom.id]![index].sender == userId
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 29,
                                bottom: 16.0,
                                left: 29,
                              ),
                              child: Container(
                                decoration: state.chatting[chatRoom.id]![index]
                                            .sender ==
                                        userId
                                    ? const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(23),
                                          topLeft: Radius.circular(23),
                                          bottomLeft: Radius.circular(23),
                                        ),
                                        color: AppStyles.whiteColor)
                                    : BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(23),
                                          topLeft: Radius.circular(23),
                                          bottomRight: Radius.circular(23),
                                        ),
                                        gradient: LinearGradient(
                                          colors: AppStyles.myPageGradientColor,
                                        ),
                                      ),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    state.chatting[chatRoom.id]![index].message,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 29,
                right: 29,
                bottom: 25,
              ),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppStyles.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: publishMessage,
                    controller: message,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'message..',
                      suffixIcon: IconButton(
                        onPressed: () {
                          publishMessage(message.text);
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
