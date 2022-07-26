import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePartner extends StatefulWidget {
  static const routeName = "/ChoosePartner";
  const ChoosePartner({Key? key}) : super(key: key);

  @override
  State<ChoosePartner> createState() => _ChoosePartnerState();
}

class _ChoosePartnerState extends State<ChoosePartner>
    with ChoosePartnerHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10.w),
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       size: 30.h,
        //       Icons.arrow_back_ios,
        //       color: AppStyles.greyColor,
        //     ),
        //   ),
        // ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Create account",
              ),
              SizedBox(height: 20.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "I’m searching for:",
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                text: "You must choose at least one!",
              ),
              SizedBox(height: 30.h),
              ...searchingFor
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        if (imSearchingFor.contains(e.name)) {
                          imSearchingFor.remove(e.name);
                          print(imSearchingFor);
                        } else {
                          imSearchingFor.add(e.name);
                          print('imSearchingFor ===> $imSearchingFor');
                        }
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        width: size.width / 2,
                        height: size.height / 14,
                        decoration: BoxDecoration(
                          color: AppStyles.whiteColor,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: imSearchingFor.contains(e.name)
                                ? AppStyles.pinkColor
                                : AppStyles.greyColor,
                            width: imSearchingFor.contains(e.name) ? 3.r : 1.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18.h,
                              child: ImageIcon(
                                (e.image).image,
                                color: imSearchingFor.contains(e.name)
                                    ? AppStyles.greyColor
                                    : AppStyles.pinkColor,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            AppText(
                              color: imSearchingFor.contains(e.name)
                                  ? AppStyles.blackColor
                                  : AppStyles.greyColor,
                              text: e.name,
                              fontFamily: GoogleFonts.raleway(
                                fontWeight: e.selected
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                              ).fontFamily,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              SizedBox(height: 140.h),
              GradientBtn(
                borderRadius: 10.r,
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  onSearchingFor();
                  // Navigator.pushNamed(context, "/UploadProfile");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: "Already have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: AppText(text: "Sign In Instead"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
