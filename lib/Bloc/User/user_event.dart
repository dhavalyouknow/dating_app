// ignore_for_file: camel_case_types
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class SetUserInitial extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends UserEvent {
  final User user;
  final Function(String) success;

  const UpdateUserEvent({
    required this.user,
    required this.success,
  });
  @override
  List<Object?> get props => [user, success];
}

class SetUser extends UserEvent {
  final User user;

  const SetUser({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
