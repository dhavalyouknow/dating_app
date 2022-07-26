import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddActivities/add_activities_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/interests_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class EnterLength extends StatefulWidget {
  const EnterLength({
    Key? key,
  }) : super(key: key);

  @override
  State<EnterLength> createState() => _EnterLengthState();
}

class _EnterLengthState extends State<EnterLength> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int currentLength = 0;

    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        margin: EdgeInsets.only(top: 430.h),
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
                  text: "Select Length (cm)",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
                AppText(
                  text: currentLength.toString(),
                  color: AppStyles.blackColor,
                )
              ],
            ),
            NumberPicker(
              value: currentLength,
              minValue: 0,
              maxValue: 150,
              axis: Axis.vertical,
              itemHeight: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
              onChanged: (value) {
                print(value);
                print(currentLength);
                currentLength = value;
                print(currentLength);
                print('---');
                setState(() {});
              },
            ),
            SizedBox(height: 5.h),
            GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Save",
              onTap: () {
                print(currentLength);
              },
            ),
          ],
        ),
      ),
    );
  }
}
