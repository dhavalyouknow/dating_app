// ignore_for_file: must_be_immutable

import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DogNameWidget extends StatefulWidget {
  final double height;
  final String txt;
  final ImageIcon dogIcon;
  final bool obscureText;
  final double border;
  final double borderRadius;
  final Color borderColor;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;

  const DogNameWidget({
    Key? key,
    required this.height,
    required this.txt,
    required this.obscureText,
    required this.border,
    required this.borderColor,
    required this.borderRadius,
    this.validator,
    this.textEditingController,
    required this.dogIcon,
  }) : super(key: key);

  @override
  State<DogNameWidget> createState() => _DogNameWidgetState();
}

class _DogNameWidgetState extends State<DogNameWidget> {
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
            Flexible(child: widget.dogIcon),
            SizedBox(width: 10.w),
            Flexible(
              child: TextFormField(
                controller: widget.textEditingController,
                validator: widget.validator,
                obscureText: widget.obscureText,
                decoration: InputDecoration(
                  hintText: widget.txt,
                  hintStyle: TextStyle(
                    fontFamily: GoogleFonts.raleway(fontSize: 15.sp).fontFamily,
                    color: AppStyles.textColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
