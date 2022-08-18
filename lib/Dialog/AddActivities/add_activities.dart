import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddActivities/add_activities_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectedActivities extends StatefulWidget {
  final Function(List<dynamic>) callback;
  final List<dynamic> alsoSelected;
  const SelectedActivities({
    Key? key,
    required this.callback,
    required this.alsoSelected,
  }) : super(key: key);

  @override
  State<SelectedActivities> createState() => _SelectedActivitiesState();
}

class _SelectedActivitiesState extends State<SelectedActivities>
    with ActivityHandlers {
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
                    text: AppLocalizations.of(context)!.cancel,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                  ),
                ),
                AppText(
                  size: 18.sp,
                  text: AppLocalizations.of(context)!.activities,
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
                  text: "$length/5",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Wrap(
                children: [
                  ...activities.map((e) {
                    selectedActivities = widget.alsoSelected;
                    return ListOfChipWidget(
                      interestsName: e,
                      onTap: () {
                        if (selectedActivities.contains(e)) {
                          selectedActivities.remove(e);
                        } else {
                          if (selectedActivities.length < 5) {
                            selectedActivities.add(e);
                          } else {
                            Fluttertoast.showToast(
                              msg: 'You can select only 5 items',
                              timeInSecForIosWeb: 5,
                            );
                          }
                        }
                        setState(() {});
                      },
                      isSelected: selectedActivities.contains(e) ||
                          widget.alsoSelected.contains(e),
                    );
                  }),
                ],
              ),
            ),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: AppLocalizations.of(context)!.save,
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
