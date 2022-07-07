part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loginSuccess,
  loginFailure,
  loading,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String? token;
  final String? message;

  const AuthState({this.status = AuthStatus.initial, this.token, this.message});

  AuthState copyWith({AuthStatus? status, String? token, String? message}) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, token, message];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(status: AuthStatus.initial);
}
