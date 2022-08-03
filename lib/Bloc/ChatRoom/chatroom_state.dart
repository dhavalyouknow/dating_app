part of 'chatroom_bloc.dart';

enum ChatRoomStatus { initial, loading, success, failure }

class ChatroomState extends Equatable {
  final ChatRoomStatus status;
  final List<ChatRoom> chatRooms;

  const ChatroomState(
      {this.status = ChatRoomStatus.initial, this.chatRooms = const []});

  ChatroomState copyWith({ChatRoomStatus? status, List<ChatRoom>? chatRooms}) {
    return ChatroomState(
      status: status ?? this.status,
      chatRooms: chatRooms ?? this.chatRooms,
    );
  }

  @override
  String toString() {
    return '''ChatroomState { status: $status, chatRooms: $chatRooms }''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, chatRooms];
}

class ChatroomInitial extends ChatroomState {}
