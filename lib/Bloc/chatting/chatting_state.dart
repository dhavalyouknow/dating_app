part of 'chatting_bloc.dart';

enum ChattingStatus { initial, loading, success, failure }

class ChattingState {
  final ChattingStatus status;
  final bool isListening;
  final Map<String, List<Chatting>> chatting;
  DateTime? lastUpdateTime;

  ChattingState({
    this.status = ChattingStatus.initial,
    this.isListening = false,
    this.chatting = const {},
    this.lastUpdateTime,
  });

  ChattingState copyWith({
    ChattingStatus? status,
    bool? isListening,
    Map<String, List<Chatting>>? chatting,
  }) {
    return ChattingState(
      status: status ?? this.status,
      isListening: isListening ?? this.isListening,
      lastUpdateTime: DateTime.now(),
      chatting: chatting ?? this.chatting,
    );
  }

  List<Object?> get props => [status, isListening, chatting];
}

class ChattingInitial extends ChattingState {}
