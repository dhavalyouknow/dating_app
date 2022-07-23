import 'package:flutter/material.dart';

mixin UploadProfileHandlers<T extends StatefulWidget> on State<T> {
  onProfileSave() {
    Navigator.pushReplacementNamed(context, "/FirstIntroPage");
  }
}
