part of 'chatting_bloc.dart';

class ChattingEvent {
  const ChattingEvent();
  List<Object?> get props => [];
}

class GetMessages extends ChattingEvent {
  final String roomId;

  const GetMessages({required this.roomId});
}

class SubscribeRoom extends ChattingEvent {
  final String roomId;

  const SubscribeRoom({required this.roomId});
  @override
  List<Object?> get props => [roomId];
}

class RemoveSubscribedRoom extends ChattingEvent {
  final String roomId;

  const RemoveSubscribedRoom({required this.roomId});
}

class PublishMessage extends ChattingEvent {
  final String roomId;
  final MqttClientPayloadBuilder builder;

  const PublishMessage({required this.roomId, required this.builder});

  @override
  List<Object?> get props => [roomId, builder];
}

class UpdateIncomingMessage extends ChattingEvent {
  final Map<String, List<Chatting>> roomMessages;

  const UpdateIncomingMessage({required this.roomMessages});

  @override
  List<Object?> get props => [roomMessages];
}
