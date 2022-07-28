import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BecomeAPremium/become_premium_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BecomePremium extends StatefulWidget {
  static const routeName = "BecomePremium";
  const BecomePremium({Key? key}) : super(key: key);

  @override
  State<BecomePremium> createState() => _BecomePremiumState();
}

class _BecomePremiumState extends State<BecomePremium>
    with BecomePremiumHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppStyles.premiumPageGradientColor,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 25.sp,
                    Icons.close,
                    color: AppStyles.whiteColor,
                  ),
                ),
              ),
              Center(
                child: AppText(
                  color: AppStyles.whiteColor,
                  size: 24.sp,
                  text: "BECOME A PREMIUM",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: AppText(
                  color: AppStyles.whiteColor,
                  size: 21.sp,
                  text: "Unlock the full experience",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: AppText(
                  textAlign: TextAlign.center,
                  color: AppStyles.whiteColor,
                  size: 15.sp,
                  text:
                      "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit, sed do eiusmod tempor.",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                decoration: const BoxDecoration(
                  color: AppStyles.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/DiamondIcon.png"),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              color: AppStyles.blackColor,
                              size: 15.sp,
                              text: "Lorem ipsum dolor sit",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              color: AppStyles.blackColor,
                              size: 13.sp,
                              text:
                                  "Et magna aliqua. Ut enim ad minim quis\nnostrud exercitation ullamco.",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icons/DiamondIcon.png"),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              color: AppStyles.blackColor,
                              size: 15.sp,
                              text: "Amet, consectetur adipscing",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              color: AppStyles.blackColor,
                              size: 13.sp,
                              text:
                                  "Et magna aliqua. Ut enim ad minim quis\nnostrud exercitation ullamco.",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icons/DiamondIcon.png"),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              color: AppStyles.blackColor,
                              size: 15.sp,
                              text: "Lorem consectetur ipsim",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              color: AppStyles.blackColor,
                              size: 13.sp,
                              text:
                                  "Et magna aliqua quis nostrud exercitation\nullamco.",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icons/DiamondIcon.png"),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              color: AppStyles.blackColor,
                              size: 15.sp,
                              text: "Consectetur adipscing amet",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              color: AppStyles.blackColor,
                              size: 13.sp,
                              text: "Et magna aliqua enim ad minim ullamco.",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 14,
                      txt: "UNLOCK PREMIUM",
                      onTap: () {},
                    ),
                    SizedBox(height: 15.h),
                    TextButton(
                      onPressed: () {},
                      child: AppText(text: "Restore Purchase"),
                    )
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
