import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/SelectGender/select_gender_handler.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectGender extends StatefulWidget {
  final Function(String) callback;
  String alreadySelected;
  SelectGender(
      {Key? key, required this.callback, required this.alreadySelected})
      : super(key: key);

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> with SelectGenderHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(widget.alreadySelected);
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                text: AppLocalizations.of(context)!.selectyourgender,
              ),
              SizedBox(height: 15.h),
              ...selectGender.map(
                (e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: GenderBtn(
                      height: size.height / 14,
                      border: widget.alreadySelected == e.name || e.selected
                          ? 2.r
                          : 1.r,
                      borderRadius: 20.r,
                      borderColor:
                          widget.alreadySelected == e.name || e.selected
                              ? AppStyles.pinkColor
                              : AppStyles.greyColor,
                      txt: e.name,
                      txtColor: widget.alreadySelected == e.name || e.selected
                          ? AppStyles.blackColor
                          : AppStyles.greyColor,
                      fontWeight: widget.alreadySelected == e.name || e.selected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      onTap: () {
                        widget.alreadySelected = '';
                        for (var tapped in selectGender) {
                          tapped.selected = false;
                        }
                        e.selected = true;
                        yourGender = e.name;
                        setState(() {});
                      },
                      icon: Icon(
                        e.icon.icon,
                        color: AppStyles.greyColor,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width / 4,
                    child: GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 18,
                      txt: "Cancel",
                      onTap: () {
                        for (var tapped in selectGender) {
                          tapped.selected = false;
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4,
                    child: GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 18,
                      txt: "Save",
                      onTap: () {
                        if (yourGender.isEmpty) {
                          yourGender = widget.alreadySelected;
                          widget.callback(yourGender);
                        } else {
                          widget.callback(yourGender);
                        }

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
