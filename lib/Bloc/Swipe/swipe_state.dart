import 'package:dating_app/Model/swipe.dart';
import 'package:equatable/equatable.dart';

enum SwipeStatus {
  initial,
  success,
  failure,
  loading,
}

class SwipeState extends Equatable {
  final SwipeStatus status;
  final List<Swipe> swipe;

  const SwipeState({this.status = SwipeStatus.initial, this.swipe = const []});

  SwipeState copyWith({SwipeStatus? status, List<Swipe>? swipe}) {
    return SwipeState(
      status: status ?? this.status,
      swipe: swipe ?? this.swipe,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, swipe];
}

class SwipeInitial extends SwipeState {
  const SwipeInitial() : super(status: SwipeStatus.initial);
}
