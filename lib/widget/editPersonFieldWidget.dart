import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPersonFieldWidget extends StatefulWidget {
  final String name;
  final Widget container;

  const EditPersonFieldWidget({
    Key? key,
    required this.name,
    required this.container,
  }) : super(key: key);

  @override
  State<EditPersonFieldWidget> createState() => _EditPersonFieldWidgetState();
}

class _EditPersonFieldWidgetState extends State<EditPersonFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h, left: 0.w, right: 0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AppStyles.blackColor,
                    ),
                  ),
                  widget.container,
                ],
              ),
              const Icon(
                Icons.edit,
                color: AppStyles.greyColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
