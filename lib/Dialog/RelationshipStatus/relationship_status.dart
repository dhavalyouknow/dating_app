import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RelationshipStatus extends StatefulWidget {
  final Function(String) callback;
  const RelationshipStatus({Key? key, required this.callback})
      : super(key: key);

  @override
  State<RelationshipStatus> createState() => _RelationshipStatusState();
}

class _RelationshipStatusState extends State<RelationshipStatus>
    with RelationShipStatusHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          height: size.height / 2.2,
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
                text: "Relationship Status",
              ),
              SizedBox(height: 15.h),
              ...relationShip.map(
                (e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: e.selected ? 3.r : 1.r,
                      borderRadius: 20,
                      borderColor: AppStyles.greyColor,
                      txt: e.status,
                      txtColor: AppStyles.greyColor,
                      onTap: () {
                        setState(() {
                          selectedStatus = e.status;
                        });
                        for (var tapped in relationShip) {
                          tapped.selected = false;
                        }
                        e.selected = true;
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: AppText(
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: "Cancel",
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4,
                    child: GradientBtn(
                      height: size.height / 18,
                      txt: "Save",
                      onTap: () {
                        widget.callback(selectedStatus);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
