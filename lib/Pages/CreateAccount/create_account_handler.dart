import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

mixin CreateAccountHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  String? nameValidator(dynamic firstName) {
    if (firstName.isEmpty) {
      return 'Enter firstname';
    }
    return null;
  }

  String? surnameValidator(dynamic lastName) {
    if (lastName.isEmpty) {
      return 'Enter lastname';
    }
    return null;
  }

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter email';
    }
    return null;
  }

  String? genderValidator(dynamic gender) {
    if (gender.isEmpty) {
      return 'Enter Gender';
    }
    return null;
  }

  String? dobValidator(dynamic gender) {
    if (gender.isEmpty) {
      return 'Enter Gender';
    }
    return null;
  }

  // String? passwordValidator(dynamic password) {
  //   if (password.isEmpty) {
  //     return 'Enter password';
  //   } else if (password.length < 6) {
  //     return 'Password must be contain 6 character';
  //   }
  //   return null;
  // }

  // String? repeatpwdValidator(dynamic repeatpwdValidator) {
  //   if (repeatpwdValidator.isEmpty) {
  //     return 'Enter repeatpassword';
  //   } else if (repeatpwdValidator != passwordController.text) {
  //     return 'Not match';
  //   }
  //   return null;
  // }

  Future<void> selectDate(BuildContext context) async {
    var datePicked = await DatePicker.showDatePicker(
      context,
      minTime: DateTime(1999, 3, 5),
      maxTime: DateTime(2019, 6, 7),
    );

    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
      });
    }
  }

  onSignUp() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequest(
          name: nameController.text,
          surname: surnameController.text,
          email: emailController.text,
          password: passwordController.text,
          repeatPassword: rePasswordController.text,
          dob: selectedDate.toString(),
          gender: genderController.text,
          success: (User user) {
            if (kDebugMode) {
              print('******success****');
            }
            Navigator.pushNamed(context, "/HomePage");
          },
        ),
      );
    }
  }
}
