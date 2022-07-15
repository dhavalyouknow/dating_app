import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin UploadProfileHandlers<T extends StatefulWidget> on State<T> {
  onProfileSave() {
    Navigator.pushNamed(context, "/FirstIntroPage");
  }
}
