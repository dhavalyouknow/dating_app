import 'dart:ffi';

import 'package:count_stepper/count_stepper.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendTicketDialog extends StatefulWidget {
  final String value;
  const AttendTicketDialog({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<AttendTicketDialog> createState() => _AttendTicketDialogState();
}

class _AttendTicketDialogState extends State<AttendTicketDialog>
    with UpComingEventsHandlers {
  @override
  Widget build(BuildContext context) {
    final String totalValue = widget.value;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: size.height / 4,
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Your Tickets",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CountStepper(
                      textStyle: TextStyle(fontSize: 25.sp),
                      defaultValue: 0,
                      max: 10,
                      min: 1,
                      splashRadius: 25,
                      onPressed: (value) {},
                    ),
                  ),
                ],
              ),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Total Amount = $totalValue",
              ),
              SizedBox(height: 15.h),
              // GradientBtn(
              //   borderRadius: 10.r,
              //   height: size.height / 16,
              //   txt: "Save",
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
