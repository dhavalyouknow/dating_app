import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/Pages/Setting/setting_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  static const routeName = "/Settings";
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with SettingHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
              size: 30.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "Settings",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppStyles.forgotPassGradientColor,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              ListTile(
                leading: Image.asset(
                  color: AppStyles.greyColor,
                  "assets/icons/StarIcon.png",
                  height: 20.h,
                ),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "MemberShip",
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/ResetPassword');
                },
                leading: const Icon(
                  Icons.lock_outline,
                  color: AppStyles.greyColor,
                ),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Password",
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person_outline_outlined),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Account settings",
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  color: AppStyles.greyColor,
                  "assets/icons/EarthIcon.png",
                  height: 20.h,
                ),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Language",
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/icons/AboutIcon.png",
                  height: 20.h,
                ),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "About",
                ),
              ),
              const Divider(),
              ListTile(
                onTap: _logOut,
                leading: Image.asset(
                  "assets/icons/LogoutIcon.png",
                  height: 20.h,
                ),
                title: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Log Out",
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logOut() async {
    BlocProvider.of<AuthBloc>(context).add(const SetLoginInitial());
    BlocProvider.of<UserBloc>(context).add(SetUserInitial());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Future.delayed(
      Duration.zero,
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (Route<dynamic> route) => false);
      },
    );
  }
}
