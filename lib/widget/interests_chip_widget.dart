import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestsChipWidget extends StatefulWidget {
  final String interestsName;
  const InterestsChipWidget({Key? key, required this.interestsName})
      : super(key: key);

  @override
  State<InterestsChipWidget> createState() => _InterestsChipWidgetState();
}

class _InterestsChipWidgetState extends State<InterestsChipWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.interestsName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(widget.interestsName),
      ),
    );
  }
}
