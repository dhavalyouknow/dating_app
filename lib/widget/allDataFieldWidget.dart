import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDataFieldWidget extends StatelessWidget {
  final User? user;

  const AllDataFieldWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Relationship Status',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.relationshipStatus!,
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'I m Interested in',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.interestedIn!,
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Have Kids?',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.haveKids!.toString(),
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Occupation',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.occupation!,
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Eye Color',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.eyeColor!,
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Length(cm)',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: AppText(
            text: user!.length!.toString(),
            size: 13.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Interests',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        ...user!.interests!
            .map((e) => Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: AppText(
                    text: e,
                    size: 13.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ))
            .toList(),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Favorite night',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        ...user!.favouriteNight!
            .map((e) => Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: AppText(
                    text: e,
                    size: 13.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ))
            .toList(),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: AppText(
            text: 'Activities',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        ...user!.activity!
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: AppText(
                  text: e,
                  size: 13.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
