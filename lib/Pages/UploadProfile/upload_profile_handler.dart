import 'package:dating_app/Pages/EditEmail/edit_email.dart';
import 'package:flutter/material.dart';

mixin UploadProfileHandlers<T extends StatefulWidget> on State<T> {
  onProfileSave() {
    Navigator.pushReplacementNamed(context, EditEmail.routeName);
  }
}
