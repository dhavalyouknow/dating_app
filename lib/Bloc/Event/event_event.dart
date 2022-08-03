part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class GetEventList extends EventEvent {
  @override
  List<Object?> get props => [];
}

class SearchEvent extends EventEvent {
  final String? searchText;
  final Function(List<Event>) onSuccess;

  const SearchEvent({
    this.searchText,
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [];
}
