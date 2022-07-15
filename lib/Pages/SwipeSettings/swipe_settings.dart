import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/SwipeSettings/swipe_settings_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeSetting extends StatefulWidget {
  const SwipeSetting({Key? key}) : super(key: key);

  @override
  State<SwipeSetting> createState() => _SwipeSettingState();
}

class _SwipeSettingState extends State<SwipeSetting>
    with SwipeSettingsHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double distance = 0;
    double age = 0;
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
          text: "Swipe Settings",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              AppText(
                size: 18.sp,
                text: "Participate on swipe",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.greyColor,
                      txt: "Yes",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.greyColor,
                      txt: "Not Now",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    size: 18.sp,
                    text: "Distance",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text: "8km",
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Slider(
                activeColor: AppStyles.pinkColor,
                inactiveColor: AppStyles.pinkColor,
                value: distance,
                onChanged: (value) {
                  setState(() {
                    distance = value;
                  });
                },
                min: 0,
                max: 100,
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 18.sp,
                text: "Only For Humans",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    size: 18.sp,
                    text: "Years",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text: "8km",
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Slider(
                activeColor: AppStyles.pinkColor,
                inactiveColor: AppStyles.pinkColor,
                value: age,
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
                min: 0,
                max: 100,
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 18.sp,
                text: "Swipe on gender",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.greyColor,
                      txt: "Mixed",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.greyColor,
                      txt: "Male",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.greyColor,
                      txt: "Women",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 60.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Save Changes",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
