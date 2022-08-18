import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin LoginHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool signUpPwd = true;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isRegister = false;

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return AppLocalizations.of(context)!.enterEmail;
    }
    return null;
  }

  String? passwordValidator(dynamic password) {
    RegExp upperCase = RegExp("^(?=.*[A-Z])");
    RegExp lowerCase = RegExp("^(?=.*[a-z])");
    RegExp specialChar = RegExp("^(?=.*[@#\$%^&+=!*])");
    RegExp minNumber = RegExp("^().{8,}");
    if (password.isEmpty) {
      return AppLocalizations.of(context)!.enterPassword;
    } else if (!upperCase.hasMatch(password)) {
      return AppLocalizations.of(context)!.pleaseEnterLowerCaseLetter;
    } else if (!lowerCase.hasMatch(password)) {
      return AppLocalizations.of(context)!.pleaseEnterUpperCaseLetter;
    } else if (!specialChar.hasMatch(password)) {
      return AppLocalizations.of(context)!.pleaseEnterSpecialCharacter;
    } else if (!minNumber.hasMatch(password)) {
      return AppLocalizations.of(context)!.passwordLengthmin8Character;
    }
    return null;
  }

  //manually login
  onLogin() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(
            email: emailController.text,
            password: passwordController.text,
            pushToken: '222222',
            success: (User user) {
              BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
              Navigator.pushReplacementNamed(context, '/MyPage');
              Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!.loginsuccessfully,
                timeInSecForIosWeb: 5,
              );
            },
            onError: () {
              Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!.invalidusernameorpassword,
                timeInSecForIosWeb: 5,
              );
            }),
      );
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  //loginWithGoogle
  signInWithGoogle() async {
    String? pushToken = await FirebaseMessaging.instance.getToken();
    GoogleSignInAccount? value = await _googleSignIn.signIn();

    if (value != null) {
      var val = await value.authentication;
      final oAuthProvider = fbAuth.OAuthProvider("google.com");
      final crd = oAuthProvider.credential(
        idToken: val.idToken,
        accessToken: val.accessToken,
      );

      var resp = await fbAuth.FirebaseAuth.instance.signInWithCredential(crd);
      String? firebaseUserId = resp.user?.uid;
      var fcmToken = await resp.user?.getIdToken();
      setState(() {
        isLoading = true;
      });

      Future.delayed(
        const Duration(seconds: 0),
        () {
          BlocProvider.of<AuthBloc>(context).add(
            LoginWithGoogle(
              email: value.email,
              firebaseUserId: firebaseUserId!,
              pushToken: pushToken!,
              firstName: resp.user!.displayName!.split(' ').first,
              lastName: resp.user!.displayName!.split(' ').last,
              //for header
              fcmtoken: fcmToken!,
              isRegistered: (value) {
                isRegister = value;
                setState(() {});
              },
              onSuccess: (User user) {
                BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
                if (isRegister == false) {
                  Navigator.pushReplacementNamed(
                    context,
                    '/OtherLoginCreateAccount',
                  );
                } else {
                  if (user.gender!.isEmpty || user.dob == null) {
                    Navigator.pushReplacementNamed(
                        context, '/OtherLoginCreateAccount');
                  } else if (user.searchingFor!.isEmpty) {
                    Navigator.pushReplacementNamed(context, '/ChoosePartner');
                  } else if (user.circleProfileImage == null) {
                    Navigator.pushReplacementNamed(context, '/UploadProfile');
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      '/MyPage',
                    );
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              onError: (value) {
                Fluttertoast.showToast(
                  msg: value,
                  timeInSecForIosWeb: 5,
                );
                _googleSignIn.signOut();
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
  signInWithFacebook() async {
    String? pushToken = await FirebaseMessaging.instance.getToken();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final fbAuth.OAuthCredential facebookAuthCredential =
        fbAuth.FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    // Once signed in, return the UserCredential
    var resp = await fbAuth.FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    String? firebaseUserId = resp.user?.uid;
    var fcmToken = await resp.user?.getIdToken();

    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(seconds: 0),
      () {
        BlocProvider.of<AuthBloc>(context).add(
          LoginWithFacebook(
            email: resp.user!.email!,
            firebaseUserId: firebaseUserId!,
            pushToken: pushToken!,
            headerToken: fcmToken!,
            isRegistered: (value) {
              isRegister = value;
              setState(() {});
            },
            onSuccess: (User user) {
              BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
              if (isRegister == false) {
                Navigator.pushReplacementNamed(
                  context,
                  '/OtherLoginCreateAccount',
                );
              } else {
                if (user.gender!.isEmpty || user.dob == null) {
                  Navigator.pushReplacementNamed(
                      context, '/OtherLoginCreateAccount');
                } else if (user.searchingFor!.isEmpty) {
                  Navigator.pushReplacementNamed(context, '/ChoosePartner');
                } else if (user.circleProfileImage == null) {
                  Navigator.pushReplacementNamed(context, '/UploadProfile');
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    '/MyPage',
                  );
                }
              }
              setState(() {
                isLoading = false;
              });
            },
            onError: (value) {
              Fluttertoast.showToast(
                msg: value,
                timeInSecForIosWeb: 5,
              );
              setState(() {
                isLoading = false;
              });
            },
          ),
        );
      },
    );
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
    final oAuthProvider = fbAuth.OAuthProvider("apple.com");

    final crd = oAuthProvider.credential(
      idToken: credential.identityToken!,
      accessToken: credential.authorizationCode,
    );
    var resp = await fbAuth.FirebaseAuth.instance.signInWithCredential(crd);

    // print(resp.user!.uid);
    // print(resp.user!.displayName!.split(' ').first);
    // print(resp.user!.displayName!.split(' ').last);
    print(resp.user?.displayName);

    var t = await resp.user?.getIdToken();
    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(seconds: 0),
      () {
        BlocProvider.of<AuthBloc>(context).add(
          LoginWithApple(
            email: credential.email ?? "",
            firstName: resp.user?.displayName == null
                ? ''
                : resp.user!.displayName!.split(' ').first,
            lastName: resp.user?.displayName == null
                ? ''
                : resp.user!.displayName!.split(' ').last,
            firebaseUserId: resp.user!.uid,
            pushToken: fcmToken!,
            headerToken: t!,
            isRegistered: (value) {
              isRegister = value;
              setState(() {});
            },
            onSuccess: (User user) {
              BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
              if (isRegister == false) {
                Navigator.pushReplacementNamed(
                  context,
                  '/OtherLoginCreateAccount',
                );
              } else {
                if (user.gender!.isEmpty || user.dob == null) {
                  Navigator.pushReplacementNamed(
                      context, '/OtherLoginCreateAccount');
                } else if (user.searchingFor!.isEmpty) {
                  Navigator.pushReplacementNamed(context, '/ChoosePartner');
                } else if (user.circleProfileImage == null) {
                  Navigator.pushReplacementNamed(context, '/UploadProfile');
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    '/MyPage',
                  );
                }
              }
              setState(() {
                isLoading = false;
              });
            },
            onError: () {
              Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!
                    .somethinghappenedwrongtryagainaftersometime,
                timeInSecForIosWeb: 5,
              );
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
