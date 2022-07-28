part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {}

class GetSwipeList extends SwipeEvent {
  final Function(List<dynamic>) onSuccess;
  GetSwipeList({required this.onSuccess});
  @override
  List<Object?> get props => [onSuccess];
}
