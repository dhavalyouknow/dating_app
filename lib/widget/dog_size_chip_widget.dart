import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DogSizeChipWidget extends StatefulWidget {
  final String interestsName;
  final VoidCallback onTap;
  final bool isSelected;
  const DogSizeChipWidget({
    Key? key,
    required this.interestsName,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<DogSizeChipWidget> createState() => _DogSizeChipWidgetState();
}

class _DogSizeChipWidgetState extends State<DogSizeChipWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                widget.isSelected ? AppStyles.pinkColor : AppStyles.greyColor,
            width: widget.isSelected ? 2.r : 1.r,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(widget.interestsName),
      ),
    );
  }
}
