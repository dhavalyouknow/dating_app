part of 'dog_bloc.dart';

enum DogStatus {
  initial,
  success,
  failure,
  loading,
}

class DogState extends Equatable {
  final DogStatus? status;
  final Dog? dog;

  const DogState({
    this.status,
    this.dog,
  });

  DogState copyWith({
    DogStatus? status,
    Dog? dog,
  }) {
    print('dog===>$dog');
    return DogState(status: status ?? this.status, dog: dog ?? this.dog);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, dog];
}

class DogInitial extends DogState {
  const DogInitial() : super(status: DogStatus.initial);
}
