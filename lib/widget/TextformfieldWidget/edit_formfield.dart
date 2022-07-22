import 'dart:ffi';

import 'package:flutter/material.dart';

class EditFormField extends StatefulWidget {
  final String hintTxt;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final double? width;
  final double? height;

  const EditFormField({
    required this.hintTxt,
    this.validator,
    this.textEditingController,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  State<EditFormField> createState() => _EditFormFieldState();
}

class _EditFormFieldState extends State<EditFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      alignment: Alignment.center,
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        obscureText: false,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintTxt,
        ),
      ),
    );
  }
}
