part of 'dog_swipe_bloc.dart';

enum DogSwipeStatus {
  initial,
  success,
  failure,
  loading,
}

class DogSwipeState extends Equatable {
  final DogSwipeStatus status;
  final List<DogSwipe> dogSwipes;

  const DogSwipeState(
      {this.status = DogSwipeStatus.initial, this.dogSwipes = const []});

  DogSwipeState copyWith({DogSwipeStatus? status, List<DogSwipe>? dogSwipes}) {
    return DogSwipeState(
      status: status ?? this.status,
      dogSwipes: dogSwipes ?? this.dogSwipes,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, dogSwipes];
}

class DogSwipeInitial extends DogSwipeState {
  const DogSwipeInitial() : super(status: DogSwipeStatus.initial);
}
