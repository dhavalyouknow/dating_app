import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LoginHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController emailController =
      TextEditingController(text: 'dp@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'Dp1@3110');
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
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password.isEmpty) {
      return 'Enter password';
    } else if (!regex.hasMatch(password)) {
      return 'Enter Valid Password';
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

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  signInWithGoogle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pushToken = prefs.getString('pushToken');
    print('********');
    print(pushToken);
    bool isLoggedIn = await _googleSignIn.isSignedIn().catchError((error) {
      print("error in getting flag");
      print(error);
      return true;
    });
    GoogleSignInAccount? value = await _googleSignIn.signIn();
    if (value != null) {
      var val = await value.authentication;
      print(value.id);
      print(value.authHeaders);
      Future.delayed(
        const Duration(seconds: 0),
        () {
          print('11111');
          BlocProvider.of<AuthBloc>(context).add(
            LoginWithGoogle(
                email: value.email,
                googleId: value.id,
                pushToken: val.idToken!,
                userBloc: BlocProvider.of<UserBloc>(context),
                onSuccess: (User user) {
                  print('**************$user');
                }),
          );
        },
      );
    }
  }

  logOut() async {
    _googleSignIn.signOut();
  }
}
