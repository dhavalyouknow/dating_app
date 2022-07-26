import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/Home/home_page.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin LoginHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController emailController =
      TextEditingController(text: 'dp2@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'Dp1@3110');
  int index = 0;
  bool signUpPwd = true;
  final formKey = GlobalKey<FormState>();
  final fbLogin = FacebookLogin();
  bool isLoading = false;

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter email';
    }
    return null;
  }

  String? passwordValidator(dynamic password) {
    // RegExp regex =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

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

  onLogin() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(
          email: emailController.text,
          password: passwordController.text,
          pushToken: '222222',
          success: (User user) {
            BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
            Navigator.pushReplacementNamed(context, MyPage.routeName);
          },
        ),
      );
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  //loginWithGoogle

  signInWithGoogle() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    GoogleSignInAccount? value = await _googleSignIn.signIn();
    if (value != null) {
      var val = await value.authentication;

      setState(() {
        isLoading = true;
      });

      Future.delayed(
        const Duration(seconds: 0),
        () {
          BlocProvider.of<AuthBloc>(context).add(
            LoginWithGoogle(
              email: value.email,
              googleId: value.id,
              pushToken: fcmToken!,
              //for header
              fcmtoken: val.idToken!,
              isRegistered: (value) {
                if (value == false) {
                  Navigator.pushReplacementNamed(
                    context,
                    '/OtherLoginCreateAccount',
                  );
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    '/MyPage',
                  );
                }
              },
              onSuccess: (User user) {
                BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
                setState(() {
                  isLoading = false;
                });
              },
              onError: () {
                Fluttertoast.showToast(
                    msg: 'Something happened wrong try again after sometime.');
                setState(() {
                  isLoading = false;
                });
              },
            ),
          );
        },
      );
    }
  }

  //loginWithFacebook

  Future signInWithFacebook() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    final res = await fbLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    setState(() {
      isLoading = true;
    });
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in
        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        final profile = await fbLogin.getUserProfile();
        final email = await fbLogin.getUserEmail();
        Future.delayed(
          const Duration(seconds: 0),
          () {
            BlocProvider.of<AuthBloc>(context).add(
              LoginWithFacebook(
                email: email!,
                facebookId: profile!.userId,
                pushToken: fcmToken!,
                headerToken: accessToken!.token,
                isRegistered: (value) {
                  if (value == false) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/OtherLoginCreateAccount',
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      '/MyPage',
                    );
                  }
                },
                onSuccess: (User user) {
                  BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
                  setState(
                    () {
                      isLoading = false;
                    },
                  );
                },
              ),
            );
          },
        );

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        Fluttertoast.showToast(msg: '${FacebookLoginStatus.cancel}');
        setState(
          () {
            isLoading = false;
          },
        );
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print(res.error);
        Fluttertoast.showToast(msg: '${res.error}');
        setState(
          () {
            isLoading = false;
          },
        );
        break;
    }
  }

  //loginWithApple

  Future signInWithApple() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    Future.delayed(
      const Duration(seconds: 0),
      () {
        BlocProvider.of<AuthBloc>(context).add(
          LoginWithApple(
            email: credential.email ?? "",
            appleId: credential.authorizationCode,
            pushToken: fcmToken!,
            headerToken: credential.identityToken!,
            onSuccess: (User user) {
              BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
              Navigator.pushReplacementNamed(
                context,
                '/MyPage',
              );
            },
          ),
        );
      },
    );
  }

  signOutFacebook() async {
    fbLogin.logOut();
  }

  logOut() async {}
}
