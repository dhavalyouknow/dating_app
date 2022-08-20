import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/Eyecolor/eyecolor_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectEyeColorWidget extends StatefulWidget {
  final Function(String) callback;
  String alreadyUsed;
  SelectEyeColorWidget(
      {Key? key, required this.callback, required this.alreadyUsed})
      : super(key: key);

  @override
  State<SelectEyeColorWidget> createState() => _SelectEyeColorWidgetState();
}

class _SelectEyeColorWidgetState extends State<SelectEyeColorWidget>
    with EyeColorHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          height: size.height / 1.7,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              AppText(
                size: 20.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: AppLocalizations.of(context)!.eyeColour,
              ),
              SizedBox(height: 30.h),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 50,
                  ),
                  itemCount: eyeColor.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.alreadyUsed = eyeColor[index];
                          selectedEyeColor = eyeColor[index];
                          // widget.callback(selectedEyeColor);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: widget.alreadyUsed
                                        .contains(eyeColor[index]) ||
                                    selectedEyeColor.contains(eyeColor[index])
                                ? 2.r
                                : 1.r,
                            color: AppStyles.pinkColor,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: AppText(
                            text: eyeColor[index],
                            fontFamily: GoogleFonts.raleway(
                              fontWeight: widget.alreadyUsed
                                          .contains(eyeColor[index]) ||
                                      selectedEyeColor.contains(eyeColor[index])
                                  ? FontWeight.w700
                                  : FontWeight.normal,
                            ).fontFamily,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 16,
                      txt: AppLocalizations.of(context)!.cancel,
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? selectedEyeColor =
                            prefs.getString('selectedEyeColor');
                        widget.callback(selectedEyeColor.toString());
                        Future.delayed(const Duration(seconds: 0), () {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Flexible(
                    child: GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 16,
                      txt: AppLocalizations.of(context)!.save,
                      onTap: () {
                        if (selectedEyeColor.isEmpty) {
                          widget.callback(widget.alreadyUsed);
                        } else {
                          widget.callback(selectedEyeColor);
                        }
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
