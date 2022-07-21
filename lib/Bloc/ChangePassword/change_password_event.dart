part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {}

class VerifyPassword extends ChangePasswordEvent {
  final String password;
  final Function(String) onSuccess;

  VerifyPassword({required this.password, required this.onSuccess});

  @override
  List<Object?> get props => [password];
}

class UpdatePassword extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  final Function(String) onSuccess;

  UpdatePassword(
      {required this.currentPassword,
      required this.newPassword,
      required this.onSuccess});

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
