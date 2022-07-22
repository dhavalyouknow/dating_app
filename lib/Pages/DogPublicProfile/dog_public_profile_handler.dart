import 'package:dating_app/Model/dog.dart';
import 'package:flutter/material.dart';

mixin DogPublicHandlers<T extends StatefulWidget> on State<T> {
  Dog? dog;
  @override
  void didChangeDependencies() {
    dog = ModalRoute.of(context)!.settings.arguments as Dog;

    super.didChangeDependencies();
  }
}
