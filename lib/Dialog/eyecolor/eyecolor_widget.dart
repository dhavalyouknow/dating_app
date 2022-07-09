import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/eyecolor/eyecolor_handler.dart';
import 'package:dating_app/Pages/SetupProfile/setup_profile1/setup_profile1_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EyeColorWidget extends StatefulWidget {
  final Function(String) callback;
  const EyeColorWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<EyeColorWidget> createState() => _EyeColorWidgetState();
}

class _EyeColorWidgetState extends State<EyeColorWidget> with EyeColorHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Center(
        child: Container(
            height: size.height / 2,
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
                  text: "Eye Colour",
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
                    itemCount: eyeColor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedEyeColor = eyeColor[index];
                            print(selectedEyeColor);
                            widget.callback(selectedEyeColor);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Center(
                            child: Text(
                              eyeColor[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GradientBtn(
                  height: size.height / 14,
                  txt: "Save",
                  onTap: () {
                    setState(() {
                      widget.callback(selectedEyeColor);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
