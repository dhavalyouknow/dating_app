import 'package:dating_app/Pages/EditEmail/edit_email.dart';
import 'package:flutter/material.dart';

mixin UploadProfileHandlers<T extends StatefulWidget> on State<T> {
  String routeName = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return;
    }
    //from myPage bcz some time image null
    String pageName = ModalRoute.of(context)!.settings.arguments.toString();
    routeName = pageName;
    print(pageName);
  }

  onProfileSave() {
    print(routeName);
    if (routeName.isEmpty) {
      Navigator.pushReplacementNamed(context, EditEmail.routeName);
    } else {
      Navigator.pushReplacementNamed(context, '/MyPage');
    }
  }
}
