import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin CreatePasswordHandlers<T extends StatefulWidget> on State<T> {
  bool signUpPwd = true;
  Map<String, dynamic>? detailList;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController =
      TextEditingController(text: 'Dp1@3110');
  final TextEditingController rePasswordController =
      TextEditingController(text: 'Dp1@3110');

  @override
  void initState() {
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

  // String password = passwordText.getText().toString();
  // if (password.isEmpty() || password.length() < 6) {  passwordText.setError("Password cannot be less than 6 characters!");
  // }
  // else {
  // passwordText.setError(null);
  // startActivity(new Intent(RegistrationActivity.this,MainActivity.class));
  // }

  String? passwordValidator(dynamic password) {
    // Password Validation
    // ^                 # start-of-string
    // (?=.*[0-9])       # a digit must occur at least once
    // (?=.*[a-z])       # a lower case letter must occur at least once
    // (?=.*[A-Z])       # an upper case letter must occur at least once
    // (?=.*[@#$%^&+=])  # a special character must occur at least once
    // (?=\S+$)          # no whitespace allowed in the entire string
    //     .{8,}             # anything, at least eight places though
    // $                 # end-of-string

    RegExp upperCase = RegExp('^(?=.*[A-Z])');
    RegExp lowerCase = RegExp('^(?=.*[a-z])');
    RegExp specialChar = RegExp("^(?=.*[@#%^&+=])");
    RegExp minNumber = RegExp('^().{8,}');
    if (password.isEmpty) {
      return 'Enter password';
    } else if (!upperCase.hasMatch(password)) {
      return 'Please Enter Upper Case Letter';
    } else if (!lowerCase.hasMatch(password)) {
      return "Please Enter Lower Case Letter";
    } else if (!specialChar.hasMatch(password)) {
      return "Please Enter Special Character";
    } else if (!minNumber.hasMatch(password)) {
      return "Password Length min 8 Character";
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
            BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
            Navigator.pushReplacementNamed(context, ChoosePartner.routeName);
          },
          onError: () {
            if (kDebugMode) {
              print('******Error****');
            }
            Fluttertoast.showToast(msg: 'Something Went Wrong');
          },
        ),
      );
    }
  }
}
