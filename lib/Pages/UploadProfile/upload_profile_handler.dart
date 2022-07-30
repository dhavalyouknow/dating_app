import 'package:dating_app/Pages/EditEmail/edit_email.dart';
import 'package:dating_app/Pages/Intro/first_intro_page.dart';
import 'package:flutter/material.dart';

mixin UploadProfileHandlers<T extends StatefulWidget> on State<T> {
  onProfileSave({required bool isVerify}) {
    Navigator.pushReplacementNamed(context, FirstIntroPage.routeName);
  }
}
