import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseDogPicture extends StatefulWidget {
  const ChooseDogPicture({Key? key}) : super(key: key);

  @override
  State<ChooseDogPicture> createState() => _ChooseDogPictureState();
}

class _ChooseDogPictureState extends State<ChooseDogPicture> {
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
                child: CircleAvatar(
                  backgroundColor: AppStyles.rosyWhiteColor,
                  radius: 300.r,
                  child: ImageIcon(
                    const AssetImage("assets/Add_Dog_Profile.png"),
                    size: 100.h,
                    color: const Color(0xffFAC7D1),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
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
                      text: "Upload Picture",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200.h),
              GradientBtn(
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
