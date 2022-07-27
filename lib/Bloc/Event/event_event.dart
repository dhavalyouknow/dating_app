part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class GetEventList extends EventEvent {
  @override
  List<Object?> get props => [];
}
