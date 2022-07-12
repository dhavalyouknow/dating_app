import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddActivities/add_activities_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedActivities extends StatefulWidget {
  final Function(List<String>) callback;
  const SelectedActivities({Key? key, required this.callback})
      : super(key: key);

  @override
  State<SelectedActivities> createState() => _SelectedActivitiesState();
}

class _SelectedActivitiesState extends State<SelectedActivities>
    with ActivityHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  onPressed: () {},
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
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    size: 15.sp,
                    text: "Done",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: AppText(
                    size: 15.sp,
                    text: "Interests Selected",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
                AppText(
                  size: 15.sp,
                  text: "3/6",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Wrap(
                children: [
                  ...interestList.map(
                    (e) => ListOfChipWidget(
                      interestsName: e,
                      onTap: () {
                        if (selectedActivities.contains(e)) {
                          selectedActivities.remove(e);
                        } else {
                          selectedActivities.add(e);
                        }
                        setState(() {});
                      },
                      isSelected: selectedActivities.contains(e),
                    ),
                  ),
                ],
              ),
            ),
            GradientBtn(
              height: size.height / 14,
              txt: "Save",
              onTap: () {
                setState(() {
                  widget.callback(selectedActivities);
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
