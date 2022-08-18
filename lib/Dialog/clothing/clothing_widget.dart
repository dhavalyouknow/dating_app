import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/clothing/clothing_widget_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClothingStyleWidget extends StatefulWidget {
  final Function(String) callback;
  String alreadyUsed;
  ClothingStyleWidget(
      {Key? key, required this.callback, required this.alreadyUsed})
      : super(key: key);

  @override
  State<ClothingStyleWidget> createState() => _ClothingStyleWidgetState();
}

class _ClothingStyleWidgetState extends State<ClothingStyleWidget>
    with ClothingWidgetHandlers {
  @override
  Widget build(BuildContext context) {
    String selectedClothingStyle = '';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
            height: size.height / 1.4,
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
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Clothing Style",
                ),
                SizedBox(height: 30.h),
                Flexible(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 50,
                    ),
                    itemCount: clothingStyle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.alreadyUsed = clothingStyle[index];
                            selectedClothingStyle = clothingStyle[index];
                            widget.callback(selectedClothingStyle);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: widget.alreadyUsed
                                          .contains(clothingStyle[index]) ||
                                      selectedClothingStyle
                                          .contains(clothingStyle[index])
                                  ? 2.r
                                  : 1.r,
                              color: AppStyles.pinkColor,
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Center(
                            child: AppText(
                              text: clothingStyle[index],
                              fontFamily: GoogleFonts.raleway(
                                fontWeight: widget.alreadyUsed
                                            .contains(clothingStyle[index]) ||
                                        selectedClothingStyle
                                            .contains(clothingStyle[index])
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
                GradientBtn(
                  borderRadius: 10.r,
                  height: size.height / 14,
                  txt: AppLocalizations.of(context)!.save,
                  onTap: () {
                    if (selectedClothingStyle.isEmpty) {
                      widget.callback(widget.alreadyUsed);
                    } else {
                      widget.callback(selectedClothingStyle);
                    }
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
