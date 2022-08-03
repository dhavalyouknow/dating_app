part of 'dog_swipe_bloc.dart';

abstract class DogSwipeEvent extends Equatable {}

class GetDogSwiperList extends DogSwipeEvent {
  final int pageNo;
  final int limitNo;
  final Function(List<DogSwipe>) onSuccess;

  GetDogSwiperList({
    required this.pageNo,
    required this.limitNo,
    required this.onSuccess,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        pageNo,
        limitNo,
        onSuccess,
      ];
}

class DisLikeDog extends DogSwipeEvent {
  final String userId;
  final String swipeUSerId;
  final VoidCallback onSuccess;

  DisLikeDog(
      {required this.userId,
      required this.swipeUSerId,
      required this.onSuccess});

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        swipeUSerId,
        onSuccess,
      ];
}

class LikeDog extends DogSwipeEvent {
  final String userId;
  final String swipeUSerId;
  final VoidCallback onSuccess;

  LikeDog(
      {required this.userId,
      required this.swipeUSerId,
      required this.onSuccess});

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        swipeUSerId,
        onSuccess,
      ];
}
