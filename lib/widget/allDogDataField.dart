import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/widget/selected_inerests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDogDataFieldWidget extends StatelessWidget {
  final Dog? dog;

  const AllDogDataFieldWidget({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: AppText(
            text: 'Gender',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        AppText(
          text: '${dog!.gender}',
          size: 13.sp,
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: AppText(
            text: 'Size',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        AppText(
          text: '${dog!.size}',
          size: 13.sp,
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: AppText(
            text: 'My dog is looking for',
            size: 17.sp,
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          ),
        ),
        Wrap(
          children: [
            ...dog!.lookingFor!
                .map(
                  (e) => SelectedChipWidget(interestsName: e),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
