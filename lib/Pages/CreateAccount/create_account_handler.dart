import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  // Icon selectedIcon;

  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final fbLogin = FacebookLogin();

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
      return 'Enter Valid Password';
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
      maxTime: DateTime(
          selectedDate.year - 18, selectedDate.month, selectedDate.day),
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

  onSubmit() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        DuplicateEvent(
          email: emailController.text,
          onSuccess: () {
            Navigator.pushNamed(
              context,
              "/CreatePassword",
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
        ),
      );
    }
  }

  signInWithGoogle() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('fcmToken ==> $fcmToken');
    GoogleSignInAccount? value = await _googleSignIn.signIn();
    if (value != null) {
      var val = await value.authentication;

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
              onSuccess: (User user) {
                BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
                Navigator.pushReplacementNamed(
                  context,
                  '/OtherLoginCreateAccount',
                );
              },
            ),
          );
        },
      );
    }
  }

  Future signInWithFacebook() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('fcmToken ==> $fcmToken');

    final res = await fbLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
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
                onSuccess: (User user) {
                  print('*****$user****');
                  BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
                  Navigator.pushReplacementNamed(
                    context,
                    '/OtherLoginCreateAccount',
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
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        Fluttertoast.showToast(msg: '${res.error}');
        break;
    }
  }
}
