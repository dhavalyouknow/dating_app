import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/CreatePassword/create_password.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin CreateAccountHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  String selectedGender = '';
  bool tapped = false;
  String countryValue = '';
  String? stateValue;
  String? cityValue;
  bool isLoading = false;
  bool isRegister = false;
  bool isColorRed = false;
  bool isOnTapFName = false;
  bool isOnTapEmail = false;
  bool isOnTapSurname = false;

  // Icon selectedIcon;

  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateTime defaultDateTime = DateTime.now();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  @override
  initState() {
    super.initState();
  }

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
    RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (email.isEmpty) {
      return 'Enter email';
    } else if (!regex.hasMatch(email)) {
      return 'Enter Valid Email';
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

  String? locationValidator(dynamic location) {
    if (location.isEmpty) {
      return 'Enter Location';
    }
    return null;
  }

  Future<void> selectDate(BuildContext context) async {
    var datePicked = await DatePicker.showDatePicker(
      context,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime(defaultDateTime.year - 18, defaultDateTime.month,
          defaultDateTime.day),
      theme: const DatePickerTheme(
        backgroundColor: AppStyles.whiteColor,
      ),
    );

    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
      });
    }
  }

  //import 'package:flutter_gen/gen_l10n/app_localizations.dart';
  onSubmit() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        DuplicateEvent(
          email: emailController.text,
          onSuccess: () {
            Fluttertoast.showToast(
              msg: AppLocalizations.of(context)!.validemail,
              timeInSecForIosWeb: 5,
            );
            Navigator.pushNamed(
              context,
              CreatePassword.routeName,
              arguments: {
                "name": nameController.text,
                "surname": surnameController.text,
                "email": emailController.text,
                "gender": selectedGender,
                "dob": selectedDate.toString(),
                "location": locationController.text,
              },
            );
          },
          onError: (value) {
            isColorRed = true;
            setState(() {});
            Fluttertoast.showToast(
              msg: '${value.split('.').first}.',
              timeInSecForIosWeb: 5,
            );
          },
        ),
      );
    }
  }

  //signupWithGoogle
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

  //signupWithFacebook
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
    // return resp;
  }

  //signupWithFacebook

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
                timeInSecForIosWeb: 3,
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
