import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddInterest/add_interest_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddInterests extends StatefulWidget {
  final Function(List<dynamic>) callback;
  final List<dynamic> alsoSelected;
  const AddInterests(
      {Key? key, required this.callback, required this.alsoSelected})
      : super(key: key);

  @override
  State<AddInterests> createState() => _AddInterestsState();
}

class _AddInterestsState extends State<AddInterests> with AddInterestsHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int length = widget.alsoSelected.length;

    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        margin: EdgeInsets.only(top: 50.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppStyles.whiteColor,
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: AppText(
                    size: 15.sp,
                    text: "Cancel",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
                AppText(
                  size: 18.sp,
                  text: "Interests",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
                SizedBox(width: 60.w)
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  size: 15.sp,
                  text: "Interests Selected",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
                AppText(
                  size: 15.sp,
                  text: '$length/6',
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Wrap(
                children: [
                  ...interestList.map((e) {
                    selectedInterestsName = widget.alsoSelected;
                    return ListOfChipWidget(
                      interestsName: e,
                      onTap: () {
                        if (selectedInterestsName.contains(e)) {
                          selectedInterestsName.remove(e);
                        } else {
                          selectedInterestsName.add(e);
                        }
                        setState(() {});
                      },
                      isSelected: selectedInterestsName.contains(e) ||
                          widget.alsoSelected.contains(e),
                    );
                  }),
                ],
              ),
            ),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Save",
              onTap: () {
                setState(() {
                  widget.callback(selectedInterestsName);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
