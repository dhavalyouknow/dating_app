import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePartner extends StatefulWidget {
  const ChoosePartner({Key? key}) : super(key: key);

  @override
  State<ChoosePartner> createState() => _ChoosePartnerState();
}

class _ChoosePartnerState extends State<ChoosePartner> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Create account",
              ),
              SizedBox(height: 20.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "I’m searching for:",
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                text: "You must choose at least one!",
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                width: size.width / 2,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: AppStyles.btnColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      // color: AppStyles.btnColor,
                      AssetImage("assets/Dog.png"),
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "Dog walks",
                      fontFamily: GoogleFonts.raleway().fontFamily,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                width: size.width / 2,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: AppStyles.btnColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FontAwesomeIcons.heart),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "Partner",
                      fontFamily: GoogleFonts.raleway().fontFamily,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                width: size.width / 2,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: AppStyles.btnColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FontAwesomeIcons.userGroup),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "Friends",
                      fontFamily: GoogleFonts.raleway().fontFamily,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/UploadProfile");
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
