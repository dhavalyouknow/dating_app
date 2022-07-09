import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImInterestedIn extends StatefulWidget {
  final Function(String) callback;
  const ImInterestedIn({Key? key, required this.callback}) : super(key: key);

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
          height: size.height / 2,
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
                text: "I’m interested in",
              ),
              SizedBox(height: 15.h),
              ...interestedIn.map(
                (e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1,
                      borderRadius: 20,
                      borderColor: AppStyles.greyColor,
                      txt: e,
                      txtColor: AppStyles.greyColor,
                      onTap: () {
                        setState(() {
                          selectedInterestedIn = e;
                          print(selectedInterestedIn);
                        });
                      },
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
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
                        widget.callback(selectedInterestedIn);
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
