import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
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
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
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
