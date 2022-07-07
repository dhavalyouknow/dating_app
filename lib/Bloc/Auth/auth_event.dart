part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginRequest extends AuthEvent {
  final String userName;
  final String password;
  final String pushToken;
  final Function(User) success;

  const LoginRequest({
    required this.userName,
    required this.password,
    required this.pushToken,
    required this.success,
  }) : super();

  @override
  List<Object?> get props => [
        userName,
        password,
        pushToken,
        success,
      ];
}

class SignUpRequest extends AuthEvent {
  final String name;
  final String surname;
  final String email;
  final String gender;
  final String dob;
  final String password;
  final String repeatPassword;
  final Function(User) success;

  const SignUpRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.gender,
    required this.dob,
    required this.password,
    required this.repeatPassword,
    required this.success,
  });

  @override
  List<Object?> get props => [
        name,
        surname,
        email,
        gender,
        dob,
        password,
        repeatPassword,
        success,
      ];
}
