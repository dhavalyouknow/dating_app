import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                text: AppLocalizations.of(context)!.createAccount,
              ),
              SizedBox(height: 20.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: AppLocalizations.of(context)!.lookingfor,
              ),
              SizedBox(height: 10.h),
              AppText(
                size: 16.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
                text: AppLocalizations.of(context)!.chooseatleastone,
              ),
              SizedBox(height: 30.h),
              ...searchingFor
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        if (imSearchingFor.contains(e.name)) {
                          imSearchingFor.remove(e.name);
                        } else {
                          imSearchingFor.add(e.name);
                        }
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        width: size.width / 2,
                        height: size.height / 14,
                        decoration: BoxDecoration(
                          color: AppStyles.whiteColor,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: imSearchingFor.contains(e.name)
                                ? AppStyles.pinkColor
                                : AppStyles.greyColor,
                            width: imSearchingFor.contains(e.name) ? 2.r : 1.r,
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
                            SizedBox(width: 8.w),
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
                txt: AppLocalizations.of(context)!.next,
                onTap: () {
                  onSearchingFor();
                  // Navigator.pushNamed(context, "/UploadProfile");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      text: AppLocalizations.of(context)!.alreadyHaveAccount),
                  TextButton(
                    onPressed: () {},
                    child: AppText(text: AppLocalizations.of(context)!.signIn),
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
