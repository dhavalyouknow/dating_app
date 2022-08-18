import 'package:dating_app/Bloc/ForgotPassword/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin AccountRecoveryHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter Email';
    }
    return null;
  }

  //   For Send Forgot password And Password will be send in email
  sentLink() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ForgotPasswordBloc>(context, listen: false).add(
        ForgotPwdRequest(
          email: emailController.text,
          onSuccess: () {
            Fluttertoast.showToast(
              msg: 'Please Check Your Email',
              timeInSecForIosWeb: 5,
            );
          },
        ),
      );
    }
  }
}
