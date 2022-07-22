import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpgradeToPremium extends StatefulWidget {
  static const routeName = "/UpgradeToPremium";
  const UpgradeToPremium({Key? key}) : super(key: key);

  @override
  State<UpgradeToPremium> createState() => _UpgradeToPremiumState();
}

class _UpgradeToPremiumState extends State<UpgradeToPremium> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          height: size.height / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppStyles.skyBlueColor,
          ),
          child: Column(
            children: [
              Container(
                height: size.height / 4,
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
                      text: "Upgrade to Premium",
                      color: AppStyles.whiteColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                    SizedBox(height: 15.h),
                    AppText(
                      textAlign: TextAlign.center,
                      size: 24.sp,
                      text: "Lorem dolore ipsum amet\ndolor ipsum sit elit.",
                      color: AppStyles.whiteColor,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
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
                      txt: "UNLOCK PREMIUM",
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      size: 15.sp,
                      text: "Restore Purchase",
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
