import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseDogPicture2 extends StatefulWidget {
  static const routeName = "/ChooseDogPicture2";
  const ChooseDogPicture2({Key? key}) : super(key: key);

  @override
  State<ChooseDogPicture2> createState() => _ChooseDogPicture2State();
}

class _ChooseDogPicture2State extends State<ChooseDogPicture2> {
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
              size: 30.h,
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
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
              Center(
                child: AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Choose Your Dog Picture",
                ),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.h),
                  child: Image.asset(
                    "assets/intro/Intro3Background.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.close,
                          color: AppStyles.crimsonPinkColor,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          color: AppStyles.crimsonPinkColor,
                          size: 18.sp,
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                  .fontFamily,
                          text: "Remove",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt_outlined),
                        SizedBox(width: 10.w),
                        AppText(
                          size: 18.sp,
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                  .fontFamily,
                          text: "Replace",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 200.h),
              GradientBtn(
                borderRadius: 10.r,
                height: size.height / 14,
                txt: "Next",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
