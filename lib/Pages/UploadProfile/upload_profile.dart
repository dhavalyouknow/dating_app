
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.btnColor,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              size: 30.h,
              Icons.arrow_back_ios,
              color: AppStyles.btnColor,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0.0,
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
              SizedBox(height: 40.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Upload Profile Picture",
              ),
              SizedBox(height: 20.h),
              Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFAC7D1),
                      blurRadius: 20.sp,
                      offset: const Offset(-1, -4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: AppStyles.rosyWhiteColor,
                  radius: 300.r,
                  child: Icon(
                    color: const Color(0xffFAC7D1),
                    Icons.person,
                    size: 120.h,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt_outlined),
                  SizedBox(width: 10.w),
                  AppText(
                    text: "Upload picture",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                ],
              ),
              SizedBox(height: 180.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/CreatePassword");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: "Already have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: AppText(text: "Sign In Instead"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
