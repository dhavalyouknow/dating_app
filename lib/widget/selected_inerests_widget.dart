import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedChipWidget extends StatefulWidget {
  final String interestsName;
  const SelectedChipWidget({Key? key, required this.interestsName})
      : super(key: key);

  @override
  State<SelectedChipWidget> createState() => _SelectedChipWidgetState();
}

class _SelectedChipWidgetState extends State<SelectedChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppStyles.pinkColor,
          width: 2.r,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(widget.interestsName),
    );
  }
}
