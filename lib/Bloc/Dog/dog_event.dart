part of 'dog_bloc.dart';

class DogEvent extends Equatable {
  const DogEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetDog extends DogEvent {
  final Dog dog;

  const SetDog({
    required this.dog,
  });

  @override
  List<Object?> get props => [dog];
}

class AddDogEvent extends DogEvent {
  final String dogName;
  final String gender;
  final String size;
  final String id;
  final List<String> lookingFor;
  final Function(Dog) onSuccess;

  const AddDogEvent({
    required this.dogName,
    required this.gender,
    required this.size,
    required this.id,
    required this.lookingFor,
    required this.onSuccess,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [dogName, gender, size, lookingFor, onSuccess, id];
}

class UpdateDogEvent extends DogEvent {
  final Dog dog;
  final Function(String) success;
  final List<String> squareProfileImage;
  final String circleProfileImage;

  const UpdateDogEvent({
    required this.dog,
    required this.success,
    required this.squareProfileImage,
    required this.circleProfileImage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [dog, success, circleProfileImage];
}
