part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {}

class GetSwipeList extends SwipeEvent {
  @override
  List<Object?> get props => [];
}

class DisLikePerson extends SwipeEvent {
  final String userId;
  final String swipeUserId;

  DisLikePerson({required this.userId, required this.swipeUserId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}
