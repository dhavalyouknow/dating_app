import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWidget extends StatelessWidget {
  final Icon icon;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const EditWidget(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.name,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 15.sp,
                color: isSelected ? AppStyles.pinkColor : AppStyles.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
