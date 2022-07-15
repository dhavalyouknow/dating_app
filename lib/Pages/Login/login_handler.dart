import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LoginHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController emailController =
      TextEditingController(text: 'dp@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: '111111');
  int index = 0;
  bool signUpPwd = true;
  final formKey = GlobalKey<FormState>();

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter email';
    }
    return null;
  }

  String? passwordValidator(dynamic password) {
    if (password.isEmpty) {
      return 'Enter password';
    } else if (password.length < 6) {
      return 'Password must be contain 6 character';
    }
    return null;
  }

  onLogin() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(
          email: emailController.text,
          password: passwordController.text,
          pushToken: '222222',
          success: (User user) {
            if (kDebugMode) {
              print('**************success********');
            }
            BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
            Navigator.pushNamed(context, "/MyPage");
          },
        ),
      );
    }
  }
}
