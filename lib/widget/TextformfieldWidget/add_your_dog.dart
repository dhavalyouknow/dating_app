// ignore_for_file: must_be_immutable

import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddYourDogWidget extends StatefulWidget {
  final double height;
  final String txt;
  final String path;
  final double border;
  final double borderRadius;
  final Color borderColor;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  // VoidCallback? onTap;

  const AddYourDogWidget({
    Key? key,
    required this.height,
    required this.txt,
    required this.path,
    required this.border,
    required this.borderColor,
    required this.borderRadius,
    this.validator,
    this.textEditingController,
    // this.onTap,
  }) : super(key: key);

  @override
  State<AddYourDogWidget> createState() => _AddYourDogWidgetState();
}

class _AddYourDogWidgetState extends State<AddYourDogWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: Container(
        height: widget.height,
        padding: EdgeInsets.only(left: 10.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.borderColor,
            width: widget.border,
          ),
        ),
        child: Row(
          children: [
            Center(
              child: Image.asset(
                widget.path,
                height: 20.h,
              ),
            ),
            TextFormField(
              // onTap: widget.onTap,
              controller: widget.textEditingController,
              validator: widget.validator,
              decoration: InputDecoration(
                hintText: widget.txt,
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.raleway(fontSize: 15.sp).fontFamily,
                  color: AppStyles.textColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
