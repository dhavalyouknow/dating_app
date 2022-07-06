import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientBtn extends StatefulWidget {
  final double height;
  final double? fontSize;
  final String txt;
  final VoidCallback onTap;

  const GradientBtn({
    Key? key,
    required this.height,
    required this.txt,
    this.fontSize,
    required this.onTap,
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
        borderRadius: BorderRadius.circular(10),
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
            fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
            fontSize: widget.fontSize,
            color: AppStyles.whiteColor,
          ),
        ),
      ),
    );
  }
}
