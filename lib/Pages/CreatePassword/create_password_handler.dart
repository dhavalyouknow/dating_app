import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin CreatePasswordHandlers<T extends StatefulWidget> on State<T> {
  Map<String, dynamic>? detailList;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print(ModalRoute.of(context)?.settings.arguments);
    if (ModalRoute.of(context)?.settings.arguments != null) {
      detailList =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    }
    return;
  }

  String? passwordValidator(dynamic password) {
    if (password.isEmpty) {
      return 'Enter password';
    } else if (password.length < 6) {
      return 'Password must be contain 6 character';
    }
    return null;
  }

  String? repeatpwdValidator(dynamic repeatpwdValidator) {
    if (repeatpwdValidator.isEmpty) {
      return 'Enter repeatpassword';
    } else if (repeatpwdValidator != passwordController.text) {
      return 'Not match';
    }
    return null;
  }

  onSignUp() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequest(
          name: detailList!["name"],
          surname: detailList!["surname"],
          email: detailList!["email"],
          password: passwordController.text,
          repeatPassword: rePasswordController.text,
          dob: detailList!["dob"],
          gender: detailList!["gender"],
          location: detailList!["location"],
          success: (User user) {
            if (kDebugMode) {
              print('******success****');
            }
            Navigator.pushNamed(context, "/SetupProfile1");
          },
        ),
      );
    }
  }
}
