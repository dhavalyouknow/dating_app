import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupProfile3 extends StatefulWidget {
  const SetupProfile3({Key? key}) : super(key: key);

  @override
  State<SetupProfile3> createState() => _SetupProfile3State();
}

class _SetupProfile3State extends State<SetupProfile3> {
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
                color: AppStyles.greyColor,
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
                    color: AppStyles.greyColor,
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "(3/3)",
                  )
                ],
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Tell us a bit about yourself",
              ),
              SizedBox(height: 10.h),
              TextFormFieldWidget(
                
                borderRadius: 40,
                height: size.width / 3,
                txt: "Description",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.textColor,
              ),
              SizedBox(height: 300.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/FirstIntroPage");
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
