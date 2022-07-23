part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class ForgotPwdRequest extends ForgotPasswordEvent {
  String email;
  final VoidCallback onSuccess;

  ForgotPwdRequest({required this.email, required this.onSuccess}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [email, onSuccess];
}
