import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddYourDogNow extends StatefulWidget {
  const AddYourDogNow({Key? key}) : super(key: key);

  @override
  State<AddYourDogNow> createState() => _AddYourDogNowState();
}

class _AddYourDogNowState extends State<AddYourDogNow> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppStyles.whiteColor),
          height: size.height / 4,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              AppText(
                color: AppStyles.blackColor,
                size: 16.sp,
                text: "Do you want to add your dog now?",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.blackColor,
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
                      borderColor: AppStyles.blackColor,
                      txt: "Later",
                      txtColor: AppStyles.blackColor,
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
