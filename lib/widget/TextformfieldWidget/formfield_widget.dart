import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldWidget extends StatefulWidget {
  final hintText;
  final TextEditingController textEditingController;
  final String? Function(dynamic) validator;
  bool obSecure;
  final IconButton? icon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType? type;
  final int? minLines;
  final int? maxLines;
  final bool? isEnabled;
  final Function(String)? onSubmit;
  final double? height;
  final double borderRadius;
  final Color borderColor;
  final double border;

  FormFieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    required this.obSecure,
    this.icon,
    this.onChanged,
    this.onTap,
    this.type,
    this.minLines,
    this.maxLines,
    this.isEnabled,
    this.onSubmit,
    this.height,
    required this.borderRadius,
    required this.borderColor,
    required this.border,
  }) : super(key: key);

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          padding: EdgeInsets.only(left: 10.w),
          margin: EdgeInsets.only(top: 18.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.borderColor,
              width: widget.border,
            ),
          ),
          child: TextFormField(
            onFieldSubmitted: widget.onSubmit,
            enabled: widget.isEnabled ?? true,
            cursorColor: AppStyles.blackColor,
            keyboardType: widget.type,
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            obscureText: widget.obSecure,
            validator: widget.validator,
            controller: widget.textEditingController,
            style:
                TextStyle(color: Theme.of(context).hintColor, fontSize: 13.sp),
            decoration: InputDecoration(
              prefixIcon: widget.obSecure == true ? widget.icon : widget.icon,
              filled: true,
              fillColor: widget.isEnabled == false
                  ? Colors.grey.shade400.withOpacity(0.5)
                  : AppStyles.whiteColor,
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isEnabled == false
                        ? Colors.grey.shade400.withOpacity(0.5)
                        : AppStyles.whiteColor,
                    width: 0.0),
                borderRadius: BorderRadius.circular(22.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppStyles.whiteColor, width: 0.0),
                borderRadius: BorderRadius.circular(22.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppStyles.whiteColor, width: 0.0),
                borderRadius: BorderRadius.circular(22.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppStyles.whiteColor, width: 0.0),
                borderRadius: BorderRadius.circular(22.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppStyles.whiteColor, width: 0.0),
                borderRadius: BorderRadius.circular(22.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: widget.isEnabled == false
                      ? Colors.grey
                      : AppStyles.placeholder
                  //color: Theme.of(context).hintColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
