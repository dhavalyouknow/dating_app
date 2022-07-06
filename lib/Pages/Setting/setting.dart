import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              color: AppStyles.btnColor,
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
                  color: AppStyles.btnColor,
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
                leading: const Icon(
                  Icons.lock_outline,
                  color: AppStyles.btnColor,
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
                  color: AppStyles.btnColor,
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
}
