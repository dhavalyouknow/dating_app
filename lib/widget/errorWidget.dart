import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.skyBlueColor,
      child: Icon(
        Icons.person,
        size: 15.sp,
        color: AppStyles.whiteColor,
      ),
    );
  }
}
