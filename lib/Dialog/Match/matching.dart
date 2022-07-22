import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Matching extends StatefulWidget {
  static const routeName = "/Matching";
  const Matching({Key? key}) : super(key: key);

  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          height: size.height / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppStyles.pinkColor,
          ),
          child: Column(
            children: [
              Container(
                height: size.height / 3.16,
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppStyles.whiteColor,
                        ),
                      ),
                    ),
                    AppText(
                      size: 24.sp,
                      text: "CONGRATULATIONS!",
                      color: AppStyles.whiteColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3.w,
                              color: AppStyles.normalBlueColor,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35.r,
                            backgroundImage: const AssetImage(
                                "assets/intro/Intro3Background.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Icon(
                            size: 28.sp,
                            Icons.favorite,
                            color: AppStyles.whiteColor,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3.w,
                              color: AppStyles.normalBlueColor,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35.r,
                            backgroundImage: const AssetImage(
                                "assets/intro/Intro3Background.png"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    AppText(
                      size: 24.sp,
                      text: "It’s a Match!",
                      color: AppStyles.whiteColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4.2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppStyles.whiteColor,
                ),
                child: Column(
                  children: [
                    GradientBtn(
                      height: size.height / 14,
                      txt: "Send Message",
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      size: 15.sp,
                      text: "Later",
                      color: AppStyles.blackColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
