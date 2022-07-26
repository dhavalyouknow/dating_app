import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientBtn extends StatefulWidget {
  final double height;
  final double? fontSize;
  final double borderRadius;
  final String txt;
  final VoidCallback onTap;
  final List<BoxShadow>? boxShadow;

  const GradientBtn({
    Key? key,
    required this.height,
    required this.txt,
    this.fontSize,
    required this.onTap,
    this.boxShadow,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<GradientBtn> createState() => _GradientBtnState();
}

class _GradientBtnState extends State<GradientBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffFFE3E9),
            Color(0xffFAC7D1),
            Color(0xffFFBCC9),
          ],
        ),
      ),
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.txt,
          style: TextStyle(
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
            fontSize: widget.fontSize,
            color: AppStyles.whiteColor,
          ),
        ),
      ),
    );
  }
}
