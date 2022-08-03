import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/ChatRoom/chatroom_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/chat_room.dart';
import 'package:dating_app/Model/participant.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_screen.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  static const routeName = 'ChatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final bool _snap = false;
  String userId = "";
  String searchString = "";

  @override
  void initState() {
    super.initState();
    loadChatRooms();
  }

  loadChatRooms() async {
    BlocProvider.of<ChatroomBloc>(context, listen: false).add(GetChatRooms());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("user_id") ?? "";
  }

  String getChatRoomImage(ChatRoom chatRoom) {
    if (chatRoom.image.isNotEmpty) {
      return chatRoom.image;
    }
    for (Participant participant in chatRoom.participants) {
      if (participant.id != userId) {
        return participant.image;
      }
    }
    return "";
  }

  String getChatRoomTitle(ChatRoom chatRoom) {
    if (chatRoom.title.isNotEmpty) {
      return chatRoom.title;
    }
    for (Participant participant in chatRoom.participants) {
      if (participant.id != userId) {
        return "${participant.firstName} ${participant.lastName}";
      }
    }
    return "";
  }

  void onSearch(String searchString) {
    setState(() {
      this.searchString = searchString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return BlocBuilder<ChatroomBloc, ChatroomState>(
            builder: (context, state) {
              print(state.chatRooms);
              if (state.status == ChatRoomStatus.loading) {
                return const LoadingWidget();
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.chatRooms.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ChatScreen.routeName,
                        arguments: state.chatRooms[index],
                      );
                    },
                    leading: CachedNetworkImage(
                        imageUrl: getChatRoomImage(state.chatRooms[index]),
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                        errorWidget: (BuildContext context, url, data) {
                          return const ImageErrorWidget();
                        }),
                    title: Text(state.chatRooms[index].title),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
