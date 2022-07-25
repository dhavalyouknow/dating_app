import 'package:flutter/material.dart';

mixin EditEmailHandler<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController editEmailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter email';
    }
    return null;
  }

  String? repeatEmailValidator(dynamic repeatEmailValidator) {
    if (repeatEmailValidator.isEmpty) {
      return 'Enter email';
    } else if (repeatEmailValidator != editEmailController.text) {
      return 'Not match';
    }
    return null;
  }
}
