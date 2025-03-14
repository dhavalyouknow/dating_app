// ignore_for_file: must_be_immutable

import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatefulWidget {
  final double height;
  final String txt;
  final IconButton? icon;
  bool? obSecure;
  final Icon? backIcon;
  final bool obscureText;
  final double border;
  final double borderRadius;
  final Color borderColor;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  VoidCallback? onTap;
  // TextAlign? textAlign;

  DescriptionWidget({
    Key? key,
    required this.height,
    required this.txt,
    this.icon,
    this.obSecure,
    this.backIcon,
    required this.obscureText,
    required this.border,
    required this.borderColor,
    required this.borderRadius,
    this.validator,
    this.textEditingController,
    this.onTap,
    // this.textAlign,
  }) : super(key: key);

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
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
        child: TextFormField(
          onTap: widget.onTap,
          controller: widget.textEditingController,
          validator: widget.validator,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.w, bottom: 60.h),
            suffixIcon: widget.backIcon,
            icon: widget.obSecure == true ? widget.icon : widget.icon,
            hintText: widget.txt,
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.raleway(fontSize: 15.sp).fontFamily,
              color: AppStyles.textColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
