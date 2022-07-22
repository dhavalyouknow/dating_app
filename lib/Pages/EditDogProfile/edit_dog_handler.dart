import 'package:dating_app/Model/dog.dart';
import 'package:flutter/material.dart';

mixin EditDogHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController editDogNameController = TextEditingController();
}
