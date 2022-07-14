// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  TextOverflow? textOverflow;
  double size;
  String text;
  String? fontFamily;
  TextAlign? textAlign;

  Color color;

  AppText({
    Key? key,
    this.color = Colors.black,
    this.size = 16,
    this.fontFamily,
    this.textAlign,
    this.textOverflow,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
      ),
    );
  }
}
