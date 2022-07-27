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
    print(event);
    print('11111');
    return EventState(
        status: status ?? this.status, event: event ?? this.event);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, event];
}

class EventInitial extends EventState {
  EventInitial() : super(status: EventStatus.initial);
}
