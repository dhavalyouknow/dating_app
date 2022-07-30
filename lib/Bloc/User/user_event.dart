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
  final VoidCallback onError;

  const UpdateUserEvent({
    required this.user,
    required this.success,
    required this.onError,
  });
  @override
  List<Object?> get props => [user, success, onError];
}

class SetUser extends UserEvent {
  final User user;

  const SetUser({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class ResendEmail extends UserEvent {
  final String headerToken;
  final VoidCallback onSuccess;
  final VoidCallback onError;

  const ResendEmail(
      {required this.headerToken,
      required this.onSuccess,
      required this.onError});
  @override
  // TODO: implement props
  List<Object?> get props => [headerToken, onSuccess, onError];
}
