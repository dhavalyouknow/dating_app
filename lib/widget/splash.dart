import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  User? user;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = prefs.getString('auth_token');
        setState(() {});
        if (token == null) {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        } else {
          await loadUser();
        }
      },
    );
  }

  loadUser() {
    BlocProvider.of<AuthBloc>(context).add(
      SessionRequest(
        onSuccess: (User user) {
          BlocProvider.of<UserBloc>(context).add(
            SetUser(user: user),
          );
          this.user = user;
          bool isSocialMedia = user.googleLogin == true ||
              user.facebookLogin == true ||
              user.appleLogin == true;
          if ((user.gender!.isEmpty || user.dob == null) && !isSocialMedia) {
            Navigator.pushReplacementNamed(context, '/CreateAccount');
          } else if (user.searchingFor!.isEmpty && !isSocialMedia) {
            Navigator.pushReplacementNamed(context, '/ChoosePartner');
          } else if (user.circleProfileImage == null && !isSocialMedia) {
            Navigator.pushReplacementNamed(context, '/UploadProfile');
          } else if (isSocialMedia &&
              (user.gender!.isEmpty || user.dob == null) &&
              user.searchingFor!.isEmpty &&
              user.circleProfileImage == null) {
            Navigator.pushReplacementNamed(
              context,
              '/OtherLoginCreateAccount',
            );
          } else {
            Navigator.pushReplacementNamed(context, '/MyPage');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppStyles.skyBlueColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Image.asset("assets/logo.png", width: 150, height: 150),
      ),
    );
  }
}
