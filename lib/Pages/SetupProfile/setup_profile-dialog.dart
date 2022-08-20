import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile1/setup_profile1.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUpProfileNow extends StatefulWidget {
  const SetUpProfileNow({Key? key}) : super(key: key);

  @override
  State<SetUpProfileNow> createState() => _SetUpProfileNowState();
}

class _SetUpProfileNowState extends State<SetUpProfileNow> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppStyles.whiteColor),
          height: size.height / 4,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              AppText(
                color: AppStyles.blackColor,
                size: 16.sp,
                text: AppLocalizations.of(context)!
                    .doyouwanttosetupyourfullprofilenow,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.blackColor,
                      txt: AppLocalizations.of(context)!.yes,
                      txtColor: AppStyles.blackColor,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          SetupProfile1.routeName,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 30.w,
                      borderColor: AppStyles.blackColor,
                      txt: AppLocalizations.of(context)!.later,
                      txtColor: AppStyles.blackColor,
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/MyPage');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
