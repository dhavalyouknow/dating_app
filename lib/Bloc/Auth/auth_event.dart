part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SetLoginInitial extends AuthEvent {
  const SetLoginInitial() : super();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DuplicateEvent extends AuthEvent {
  final String email;
  final VoidCallback onSuccess;
  final Function(String) onError;

  const DuplicateEvent(
      {required this.email, required this.onSuccess, required this.onError});

  @override
  List<Object?> get props => [];
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;
  final String pushToken;
  final Function(User) success;

  const LoginRequest({
    required this.email,
    required this.password,
    required this.pushToken,
    required this.success,
  }) : super();

  @override
  List<Object?> get props => [
        email,
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
  final String location;
  final Function(User) success;
  final VoidCallback onError;

  const SignUpRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.gender,
    required this.dob,
    required this.password,
    required this.repeatPassword,
    required this.location,
    required this.success,
    required this.onError,
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
        location,
        success,
        onError,
      ];
}

class SessionRequest extends AuthEvent {
  final Function(User) onSuccess;

  const SessionRequest({required this.onSuccess});

  @override
  List<Object?> get props => [onSuccess];
}

class LoginWithGoogle extends AuthEvent {
  final String email;
  final String firebaseUserId;
  final String pushToken;
  final String firstName;
  final String lastName;

  //headertoken
  final String fcmtoken;
  final Function(User) onSuccess;
  final Function(bool) isRegistered;
  final Function(String) onError;

  const LoginWithGoogle({
    required this.email,
    required this.firebaseUserId,
    required this.pushToken,
    required this.firstName,
    required this.lastName,
    required this.fcmtoken,
    required this.onSuccess,
    required this.isRegistered,
    required this.onError,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginWithFacebook extends AuthEvent {
  final String email;
  final String firebaseUserId;
  final String pushToken;
  final String headerToken;
  final Function(User) onSuccess;
  final Function(bool) isRegistered;
  final Function(String) onError;

  const LoginWithFacebook({
    required this.email,
    required this.firebaseUserId,
    required this.pushToken,
    required this.headerToken,
    required this.onSuccess,
    required this.isRegistered,
    required this.onError,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        firebaseUserId,
        pushToken,
        headerToken,
      ];
}

class LoginWithApple extends AuthEvent {
  final String email;
  final String firebaseUserId;
  final String pushToken;
  final String headerToken;
  final Function(User) onSuccess;
  final Function(bool) isRegistered;
  final VoidCallback onError;
  final String firstName;
  final String lastName;

  const LoginWithApple({
    required this.email,
    required this.firebaseUserId,
    required this.pushToken,
    required this.headerToken,
    required this.onSuccess,
    required this.isRegistered,
    required this.onError,
    required this.firstName,
    required this.lastName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        firebaseUserId,
        pushToken,
        headerToken,
        onSuccess,
        isRegistered,
      ];
}
