import 'package:dating_app/Bloc/ChangePassword/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ResetPasswordHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController currentPwdController = TextEditingController();
  final TextEditingController newPwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
  bool isVerifySuccessfull = false;
  bool signUpPwd = false;
  final formKey = GlobalKey<FormState>();

  String? currentValidator(dynamic password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password.isEmpty) {
      return 'Enter password';
    } else if (!regex.hasMatch(password)) {
      return 'Your password must be contains atleast one letter,special character and 8 characters,';
    }
    return null;
  }

  verifyPassword() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ChangePasswordBloc>(context).add(
        VerifyPassword(
          password: currentPwdController.text,
          onSuccess: (success) {
            isVerifySuccessfull = true;
            setState(() {});
          },
        ),
      );
    }
  }

  updatePassword() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ChangePasswordBloc>(context).add(
        UpdatePassword(
          currentPassword: newPwdController.text,
          newPassword: confirmPwdController.text,
          onSuccess: (success) {
            Fluttertoast.showToast(msg: 'Password has been updated..');
          },
        ),
      );
    }
  }
}
