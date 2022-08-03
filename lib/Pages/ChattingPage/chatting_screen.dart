import 'dart:convert';
import 'package:dating_app/Bloc/chatting/chatting_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/chat_room.dart';
import 'package:dating_app/Model/participant.dart';
import 'package:dating_app/mqtt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int index = -1;

  PopupMenuItem _buildPopupMenuItem(String menuTitle,
      {required bool isSelected, required VoidCallback onTap}) {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              menuTitle,
              style: TextStyle(
                  color:
                      isSelected ? AppStyles.pinkColor : AppStyles.blackColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    chatRoom = ModalRoute.of(context)?.settings.arguments as ChatRoom;
    if (kDebugMode) {
      print(chatRoom.participants);
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppStyles.forgotPassGradientColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppStyles.greyColor),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            getChatRoomTitle(chatRoom),
            style: const TextStyle(color: AppStyles.blackColor),
          ),
          actions: [
            PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              children: [
                                _buildPopupMenuItem('Archive chat',
                                    isSelected: index == 0, onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                }),
                                _buildPopupMenuItem('Report chat',
                                    isSelected: index == 1, onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                }),
                                _buildPopupMenuItem('Block user',
                                    isSelected: index == 2, onTap: () {
                                  setState(() {
                                    index = 2;
                                  });
                                }),
                              ],
                            );
                          },
                        ),
                      )
                    ])
          ],
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
                                        color: AppStyles.skyBlueColor,
                                      )
                                    : const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(23),
                                          topLeft: Radius.circular(23),
                                          bottomRight: Radius.circular(23),
                                        ),
                                        color: AppStyles.lightGreyColor,
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
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 0,
                      bottom: 29,
                    ),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppStyles.whiteColor,
                        border: Border.all(
                          color: AppStyles.greyColor,
                        ),
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
                            hintText: 'Type your message',
                            hintStyle:
                                const TextStyle(color: AppStyles.greyColor),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                publishMessage(message.text);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 5.w,
                                ),
                                width: 70.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: AppStyles.pinkGradientColor,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      color: AppStyles.whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: AppStyles.pinkGradientColor,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 29, left: 5),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppStyles.whiteColor,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
