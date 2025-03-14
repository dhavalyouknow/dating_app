import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleBtnWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Image image;
  final Color color;

  const GoogleBtnWidget({
    required this.onPressed,
    required this.title,
    required this.image,
    required this.color,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          height: size.height / 14,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: AppText(
                  size: 16.sp,
                  text: title,
                  color: AppStyles.blackColor,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
