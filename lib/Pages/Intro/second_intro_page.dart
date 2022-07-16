// ignore_for_file: unused_local_variable

import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondIntroPage extends StatefulWidget {
  const SecondIntroPage({Key? key}) : super(key: key);

  @override
  State<SecondIntroPage> createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage> {
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
                                AssetImage("assets/intro/Intro2Background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
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
                  SizedBox(height: 10.h),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10.h,
                      radius: 12.0.r,
                      activeDotColor: AppStyles.greyColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Attend mingles and meet\nPeople",
                    size: 20.sp,
                  ),
                  SizedBox(height: 30.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text: "Meet friends and dog lovers",
                    size: 15.sp,
                  ),
                  SizedBox(height: 20.h),
                  GradientBtn(
                    height: size.height / 14,
                    txt: "Next",
                    onTap: () {
                      Navigator.pushNamed(context, "/ThirdIntroPage");
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                      text: "Skip",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
