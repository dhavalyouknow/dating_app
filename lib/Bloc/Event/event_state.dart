part of 'event_bloc.dart';

enum EventStatus {
  initial,
  success,
  failure,
  loading,
}

class EventState extends Equatable {
  final EventStatus status;
  final List<Event>? event;

  EventState({
    required this.status,
    this.event,
  });

  EventState copyWith({
    EventStatus? status,
    List<Event>? event,
  }) {
    return EventState(
        status: status ?? this.status, event: event ?? this.event);
  }

  @override
  List<Object?> get props => [status, event];
}

class EventInitial extends EventState {
  EventInitial() : super(status: EventStatus.initial);
}
