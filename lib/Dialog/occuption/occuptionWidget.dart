import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/occuption/occuption_handller.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OccupationWidget extends StatefulWidget {
  final Function(String) callback;
  String alreadyUsed;
  OccupationWidget(
      {Key? key, required this.callback, required this.alreadyUsed})
      : super(key: key);

  @override
  State<OccupationWidget> createState() => _OccupationWidgetState();
}

class _OccupationWidgetState extends State<OccupationWidget>
    with OccuptionHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          height: size.height / 2.0,
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              AppText(
                size: 20.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: AppLocalizations.of(context)!.occupation,
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 50,
                  ),
                  itemCount: occupations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.alreadyUsed = occupations[index];
                          selectedOccupation = occupations[index];
                          widget.callback(selectedOccupation);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppStyles.pinkColor,
                            width: widget.alreadyUsed == occupations[index] ||
                                    selectedOccupation
                                        .contains(occupations[index])
                                ? 2.r
                                : 1.r,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: AppText(
                            text: occupations[index],
                            fontFamily: GoogleFonts.raleway(
                                    fontWeight: widget.alreadyUsed ==
                                                occupations[index] ||
                                            selectedOccupation
                                                .contains(occupations[index])
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
              GradientBtn(
                borderRadius: 10.r,
                height: size.height / 14,
                txt: AppLocalizations.of(context)!.save,
                onTap: () {
                  if (selectedOccupation.isEmpty) {
                    widget.callback(widget.alreadyUsed);
                  } else {
                    widget.callback(selectedOccupation);
                  }
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
