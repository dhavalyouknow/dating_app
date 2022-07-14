import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/CheckMail/check_mail_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> with checkMailHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffCEEFFF),
              Color(0xffB6E4FA),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20.h,
                    color: AppStyles.greyColor,
                  ),
                ),
              ),
              Image.asset("assets/mail_icon.png"),
              Center(
                child: AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Check your email",
                ),
              ),
              SizedBox(height: 15.h),
              AppText(
                text: "We have sent a link to recover to your account.",
              ),
              SizedBox(height: 15.h),
              GradientBtn(
                height: size.height / 16,
                txt: "Confirm Email Address",
                onTap: () {
                  Navigator.pushNamed(context, "/ResetPassword");
                },
              ),
              SizedBox(height: 15.h),
              AppText(
                size: 15.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Resend email",
              ),
              SizedBox(height: 50.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                text:
                    "Didn’t receive the link?\nMake sure to check your spam filter.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
