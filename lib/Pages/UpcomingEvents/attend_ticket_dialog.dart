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
  final int value;
  const AttendTicketDialog({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<AttendTicketDialog> createState() => _AttendTicketDialogState();
}

class _AttendTicketDialogState extends State<AttendTicketDialog>
    with UpComingEventsHandlers {
  int count = 1;
  int? total;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _incrementCount() {
      setState(() {
        count++;
        // widget.value = widget.value as int;
        total = count * widget.value;
      });
    }

    void _decrementCount() {
      if (count <= 1) {
        return;
      }
      setState(() {
        count--;
        total = widget.value as int;
        total = count * widget.value;
      });
    }

    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: size.height / 3,
          decoration: BoxDecoration(
            color: AppStyles.primaryColor,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _incrementCount,
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 25.sp,
                      ),
                    ),
                    AppText(
                      text: count.toString(),
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w600)
                              .fontFamily,
                      size: 25.sp,
                    ),
                    IconButton(
                      onPressed: _decrementCount,
                      icon: Icon(
                        Icons.remove_circle_outline_outlined,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
              ),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Total Amount = ${total.toString()}",
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 4,
                      child: GradientBtn(
                        boxShadow: [
                          BoxShadow(
                            color: AppStyles.shadowColor.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 30,
                            offset: const Offset(
                                2, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: 10.r,
                        height: size.height / 16,
                        txt: "Cancel",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width / 4,
                      child: GradientBtn(
                        boxShadow: [
                          BoxShadow(
                            color: AppStyles.shadowColor.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 30,
                            offset: const Offset(
                                2, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: 10.r,
                        height: size.height / 16,
                        txt: "Save",
                        onTap: () {
                          onAttendEvent(count);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
