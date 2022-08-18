import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatefulWidget {
  final hintText;
  final TextEditingController textEditingController;
  final String? Function(dynamic) validator;
  bool obSecure;
  final IconButton? icon;
  final IconButton? suffixIcon;
  final IconButton? backIcon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType? type;
  final int? minLines;
  final int? maxLines;
  final Function(String)? onSubmit;
  final double borderRadius;
  final Color borderColor;
  final Color? backgroundColor;
  final double border;
  FocusNode? focusNode;
  TextInputAction? textInputAction;

  FormFieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    required this.obSecure,
    this.icon,
    this.suffixIcon,
    this.backIcon,
    this.onChanged,
    this.onTap,
    this.type,
    this.textInputAction,
    this.focusNode,
    this.minLines,
    this.maxLines,
    this.onSubmit,
    required this.borderRadius,
    required this.borderColor,
    required this.border,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.h),
      alignment: Alignment.center,
      child: TextFormField(
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onSubmit,
        cursorColor: AppStyles.blackColor,
        keyboardType: widget.type,
        minLines: widget.minLines ?? 1,
        maxLines: widget.maxLines ?? 1,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        obscureText: widget.obSecure,
        validator: widget.validator,
        controller: widget.textEditingController,
        style: TextStyle(
          color: AppStyles.blackColor,
          fontSize: 14.sp,
          fontFamily:
              GoogleFonts.raleway(fontSize: 20.sp, fontWeight: FontWeight.w600)
                  .fontFamily,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor,
          prefixIcon: widget.obSecure == true ? widget.icon : widget.icon,
          border: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: widget.border,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 2.0),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.borderColor, width: widget.border),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 1.2),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 20.w,
          ),
          hintText: widget.hintText,
          suffixIcon:
              widget.obSecure == true ? widget.backIcon : widget.backIcon,
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.raleway(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ).fontFamily,
            color: AppStyles.greyColor,
          ),
        ),
      ),
    );
  }
}
