import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImInterestedIn extends StatefulWidget {
  final Function(String) callback;
  String alreadyUsed;
  ImInterestedIn({Key? key, required this.callback, required this.alreadyUsed})
      : super(key: key);

  @override
  State<ImInterestedIn> createState() => _ImInterestedInState();
}

class _ImInterestedInState extends State<ImInterestedIn>
    with ImInterestedInHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: size.height / 2.3,
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
                text: AppLocalizations.of(context)!.imInterestedIn,
              ),
              SizedBox(height: 15.h),
              ...selectedInterestedName.map(
                (e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: DefaultAppBtn(
                      fontWeight:
                          e.selected ? FontWeight.w700 : FontWeight.normal,
                      height: size.height / 14,
                      border: widget.alreadyUsed == e.interest || e.selected
                          ? 2.r
                          : 1.r,
                      borderRadius: 20,
                      borderColor: AppStyles.pinkColor,
                      txt: e.interest,
                      txtColor: e.selected
                          ? AppStyles.blackColor
                          : AppStyles.greyColor,
                      onTap: () {
                        setState(() {
                          widget.alreadyUsed = e.interest;
                          selectedInterestedIn = e.interest;
                        });
                        for (var tapped in selectedInterestedName) {
                          tapped.selected = false;
                        }
                        e.selected = true;
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 2.7,
                      child: GradientBtn(
                        borderRadius: 10.r,
                        height: size.height / 18,
                        txt: AppLocalizations.of(context)!.cancel,
                        onTap: () {
                          for (var tapped in selectedInterestedName) {
                            tapped.selected = false;
                          }
                          widget.callback(widget.alreadyUsed);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.7,
                      child: GradientBtn(
                        borderRadius: 10.r,
                        height: size.height / 18,
                        txt: AppLocalizations.of(context)!.save,
                        onTap: () {
                          if (selectedInterestedIn.isEmpty) {
                            widget.callback(widget.alreadyUsed);
                          } else {
                            widget.callback(selectedInterestedIn);
                          }

                          Navigator.pop(context);
                        },
                      ),
                    )
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
