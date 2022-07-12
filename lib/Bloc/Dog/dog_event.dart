part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  const DogEvent();
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
