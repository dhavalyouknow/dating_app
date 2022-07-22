part of 'forgot_password_bloc.dart';

enum ForgotStatus { initial, loading, success, failure }

class ForgotPasswordState extends Equatable {
  final ForgotStatus status;
  final ForgotPassword? forgotPassword;

  const ForgotPasswordState(
      {this.status = ForgotStatus.initial, this.forgotPassword});

  ForgotPasswordState copyWith(
      {ForgotStatus? status, ForgotPassword? forgotPassword}) {
    return ForgotPasswordState(
        status: status ?? this.status,
        forgotPassword: forgotPassword ?? this.forgotPassword);
  }

  @override
  String toString() {
    return '''ForgotPwdState { status: $status,forgotPassword: ${forgotPassword?.toJson()}''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, forgotPassword];
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial() : super(status: ForgotStatus.initial);
}
