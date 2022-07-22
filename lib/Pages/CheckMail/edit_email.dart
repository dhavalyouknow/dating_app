import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditEmail extends StatefulWidget {
  static const routeName = "/EditEmail";
  const EditEmail({Key? key}) : super(key: key);

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
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
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 25.sp,
                    color: AppStyles.greyColor,
                  ),
                ),
              ),
              Image.asset("assets/mail_icon.png"),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Almost There!",
              ),
              SizedBox(height: 20.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                textAlign: TextAlign.center,
                text:
                    "We just sent a confirmation link to\nplaceholder@gmail.com\nCheck your email for a link to sign in.",
              ),
              SizedBox(height: 20.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Edit email address",
                onTap: () {},
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/SetupProfile1");
                },
                child: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Resend Email",
                ),
              ),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                textAlign: TextAlign.center,
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
