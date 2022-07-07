// ignore_for_file: unused_local_variable

import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThirdIntroPage extends StatefulWidget {
  const ThirdIntroPage({Key? key}) : super(key: key);

  @override
  State<ThirdIntroPage> createState() => _ThirdIntroPageState();
}

class _ThirdIntroPageState extends State<ThirdIntroPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = PageController(viewportFraction: 1, keepPage: true);
    // PageController? pageController;
    int currentIndex = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400.h,
              child: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: 3,
                    itemBuilder: (context, galleryIndex) {
                      return Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/intro/Intro3Background.png"),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: size.width / 4 + 10.w,
                    bottom: 15.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppStyles.whiteColor,
                                width: 3.w,
                              ),
                              color: AppStyles.greyColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              size: 35.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppStyles.whiteColor,
                              width: 3.w,
                            ),
                            color: AppStyles.greyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 35.sp,
                            color: AppStyles.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppStyles.introGradientColor,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10.h,
                      radius: 12.0.r,
                      activeDotColor: AppStyles.greyColor,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Find the Dream Match for your\nBest Friend!",
                    size: 20.sp,
                  ),
                  SizedBox(height: 15.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text:
                        "Make the perfect match for your furry friend.\nAnd who knows, you could be next!",
                    size: 15.sp,
                  ),
                  SizedBox(height: 15.h),
                  GradientBtn(
                    height: size.height / 14,
                    txt: "Get Started",
                    onTap: () {
                      Navigator.pushNamed(context, "/AddYourDog");
                    },
                  ),
                  SizedBox(height: 15.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text:
                        "By pressing Get Started button, you agree to\nthe Terms of Service and Privacy Policy.",
                    size: 13.sp,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
