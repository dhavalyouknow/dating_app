import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RelationshipStatus extends StatefulWidget {
  final Function(String) callback;
  String status;
  RelationshipStatus({Key? key, required this.callback, required this.status})
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
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          height: size.height / 2.3,
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: AppLocalizations.of(context)!.relationshipStatus,
              ),
              SizedBox(height: 20.h),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 50,
                  ),
                  itemCount: relationShipStatus.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.status = relationShipStatus[index];
                          selectedStatus = relationShipStatus[index];
                          widget.callback(selectedStatus);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppStyles.pinkColor,
                            width: widget.status == relationShipStatus[index] ||
                                    selectedStatus
                                        .contains(relationShipStatus[index])
                                ? 2.r
                                : 1.r,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: AppText(
                            text: relationShipStatus[index],
                            fontFamily: GoogleFonts.raleway(
                                    fontWeight: widget.status ==
                                                relationShipStatus[index] ||
                                            selectedStatus.contains(
                                                relationShipStatus[index])
                                        ? FontWeight.w700
                                        : FontWeight.normal)
                                .fontFamily,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15.h),
              GradientBtn(
                borderRadius: 10.r,
                height: size.height / 14,
                txt: AppLocalizations.of(context)!.save,
                onTap: () {
                  if (selectedStatus.isEmpty) {
                    widget.callback(widget.status);
                  } else {
                    widget.callback(selectedStatus);
                  }

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
