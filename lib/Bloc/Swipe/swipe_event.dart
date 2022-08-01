part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {}

class GetSwipeList extends SwipeEvent {
  final int pageNo;
  final int limitNo;

  GetSwipeList({required this.pageNo, required this.limitNo});
  @override
  List<Object?> get props => [];
}

class DisLikePerson extends SwipeEvent {
  final String userId;
  final String swipeUserId;
  final Function(String) onSuccess;

  DisLikePerson({
    required this.userId,
    required this.swipeUserId,
    required this.onSuccess,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userId, onSuccess];
}

class LikePerson extends SwipeEvent {
  final String userId;
  final String swipeUserId;
  final Function(String) onSuccess;

  LikePerson({
    required this.userId,
    required this.swipeUserId,
    required this.onSuccess,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        swipeUserId,
        onSuccess,
      ];
}
