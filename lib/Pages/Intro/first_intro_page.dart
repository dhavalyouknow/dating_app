import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstIntroPage extends StatefulWidget {
  const FirstIntroPage({Key? key}) : super(key: key);

  @override
  State<FirstIntroPage> createState() => _FirstIntroPageState();
}

class _FirstIntroPageState extends State<FirstIntroPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = PageController(viewportFraction: 1, keepPage: true);
    // PageController? pageController;
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
                      setState(() {});
                    },
                    controller: controller,
                    itemCount: 3,
                    itemBuilder: (context, galleryIndex) {
                      return Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/intro/Intro1Background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200.w,
                      height: 150.h,
                      child: Image.asset(
                        "assets/intro/IntroLogo.png",
                      ),
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
                    text: "Welcome to the dogtrick!",
                    size: 20.sp,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    textAlign: TextAlign.center,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    text: "Swipe\nAttend mingles\nDog walks\nNanny",
                    size: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  GradientBtn(
                    height: size.height / 14,
                    txt: "Next",
                    onTap: () {
                      Navigator.pushNamed(context, "/SecondIntroPage");
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
