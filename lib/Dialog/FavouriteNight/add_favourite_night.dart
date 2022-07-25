import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/FavouriteNight/add_favourite_night_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/selected_inerests_widget.dart';

class AddNightModule extends StatefulWidget {
  final Function(List<String>) callback;
  final List<String> alsoSelected;
  const AddNightModule(
      {Key? key, required this.callback, required this.alsoSelected})
      : super(key: key);

  @override
  State<AddNightModule> createState() => _AddNightModuleState();
}

class _AddNightModuleState extends State<AddNightModule>
    with AddNightModuleHandlers {
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
                  text: "Favourite Night",
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
                  text: "Favourite Night Selected",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
                AppText(
                  size: 15.sp,
                  text: "$length /6",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Wrap(
                children: [
                  ...favouriteNight.map((e) {
                    selectedNights = widget.alsoSelected;
                    return ListOfChipWidget(
                      interestsName: e,
                      onTap: () {
                        if (selectedNights.contains(e)) {
                          selectedNights.remove(e);
                        } else {
                          selectedNights.add(e);
                        }
                        setState(() {});
                      },
                      isSelected: selectedNights.contains(e) ||
                          widget.alsoSelected.contains(e),
                    );
                  }),
                ],
              ),
            ),
            GradientBtn(
              height: size.height / 14,
              txt: "Save",
              onTap: () {
                setState(() {
                  widget.callback(selectedNights);
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
