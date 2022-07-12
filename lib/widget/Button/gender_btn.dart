import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderBtn extends StatefulWidget {
  final double height;
  final double border;
  final double borderRadius;
  final Color borderColor;
  final Color txtColor;
  final String txt;
  final VoidCallback onTap;
  final Icon icon;
  // String? fontFamily;

  const GenderBtn({
    Key? key,
    required this.height,
    required this.border,
    required this.borderRadius,
    required this.borderColor,
    required this.txt,
    required this.txtColor,
    required this.onTap,
    required this.icon,
    // this.fontFamily,
  }) : super(key: key);

  @override
  State<GenderBtn> createState() => _GenderBtnState();
}

class _GenderBtnState extends State<GenderBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        height: widget.height,
        width: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.icon,
            Text(
              widget.txt,
              style: TextStyle(
                fontFamily: GoogleFonts.raleway().fontFamily,
                color: widget.txtColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
