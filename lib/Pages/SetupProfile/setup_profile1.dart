import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupProfile1 extends StatefulWidget {
  const SetupProfile1({Key? key}) : super(key: key);

  @override
  State<SetupProfile1> createState() => _SetupProfile1State();
}

class _SetupProfile1State extends State<SetupProfile1> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    textAlign: TextAlign.center,
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Setup Profile",
                  ),
                  AppText(
                    color: AppStyles.btnColor,
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "(1/3)",
                  )
                ],
              ),
              SizedBox(height: 20.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Have a dog?",
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      onTap: () {},
                      borderRadius: 20.r,
                      height: size.height / 16,
                      border: 1.r,
                      borderColor: AppStyles.btnColor,
                      txt: "Yes",
                      txtColor: AppStyles.blackColor,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: DefaultAppBtn(
                      onTap: () {},
                      borderRadius: 20.r,
                      height: size.height / 16,
                      border: 1.r,
                      borderColor: AppStyles.btnColor,
                      txt: "No",
                      txtColor: AppStyles.btnColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Relationship Status",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {},
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.btnColor,
                txt: "Select An Option",
                txtColor: AppStyles.btnColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "I'm Interested In",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {},
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.btnColor,
                txt: "Select An Option",
                txtColor: AppStyles.btnColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Have kids?",
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      onTap: () {},
                      borderRadius: 20.r,
                      height: size.height / 16,
                      border: 1.r,
                      borderColor: AppStyles.btnColor,
                      txt: "Yes",
                      txtColor: AppStyles.blackColor,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: DefaultAppBtn(
                      onTap: () {},
                      borderRadius: 20.r,
                      height: size.height / 16,
                      border: 1.r,
                      borderColor: AppStyles.btnColor,
                      txt: "No",
                      txtColor: AppStyles.btnColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Occupation",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {},
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.btnColor,
                txt: "Select An Option",
                txtColor: AppStyles.btnColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Eye Colour",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {},
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.btnColor,
                txt: "Select An Option",
                txtColor: AppStyles.btnColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Length (cm)",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {},
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.btnColor,
                txt: "Enter Your Length",
                txtColor: AppStyles.btnColor,
              ),
              SizedBox(height: 20.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/SetupProfile2");
                },
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
