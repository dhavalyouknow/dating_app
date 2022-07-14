import 'package:flutter/material.dart';

mixin SelectGenderHandlers<T extends StatefulWidget> on State<T> {
  String yourGender = '';
  // Icon genderIcon;

  List<String> selectedGender = [];
}
