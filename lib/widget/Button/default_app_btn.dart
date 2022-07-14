import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBtn extends StatefulWidget {
  final double height;
  final double? width;
  final double border;
  final double borderRadius;
  final Color borderColor;
  final Color txtColor;
  final String txt;
  final VoidCallback onTap;

  const DefaultAppBtn({
    Key? key,
    required this.height,
    this.width,
    required this.border,
    required this.borderRadius,
    required this.borderColor,
    required this.txt,
    required this.txtColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DefaultAppBtn> createState() => _DefaultAppBtnState();
}

class _DefaultAppBtnState extends State<DefaultAppBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        height: widget.height,
        width: widget.width,
        // width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.borderColor,
            width: widget.border,
          ),
        ),
        child: Text(
          widget.txt,
          style: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            color: widget.txtColor,
          ),
        ),
      ),
    );
  }
}
