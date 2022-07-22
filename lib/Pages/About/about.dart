import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/About/about_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  static const routeName = "/About";
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with AboutHandlers {
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
          text: "About",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
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
                size: 21.sp,
                text: "The Dog Trick",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 14.sp,
                text:
                    "Lorem ipsum dolor sit amet, elit, sed do\neiusmod tempor incididunt ut labore et dolore\nmagna aliqua. Ut enim ad minim veniam, quis\nnostrud exercitation ullamco laboris nisi ut\naliquip ex ea commodo consequat.\n\nLorem ipsum dolor sit amet,  adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim\nveniam, quis nostrud exercitation ullamco\nlaboris nisi ut aliquip ex ea commodo\nconsequat.\n\nHope you enjoy our app as much as I do!",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              ),
              SizedBox(height: 10.h),
              Image.asset("assets/Signature.png", height: 40.h),
              SizedBox(height: 10.h),
              AppText(
                size: 16.sp,
                text: "Eveline Martinsson",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
              ),
              SizedBox(height: 5.h),
              AppText(
                size: 16.sp,
                text: "The Dog Trick CEO",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              ),
              SizedBox(height: 50.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Contact",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
