import 'package:dating_app/Model/dog.dart';
import 'package:flutter/material.dart';

mixin EditDogHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController editDogNameController = TextEditingController();
  TextEditingController editDogGenderController = TextEditingController();
  Dog? dog;
  String dogSize = '';
  List<String> isdogLookingFor = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)?.settings.arguments != null) {
      dog = ModalRoute.of(context)?.settings.arguments as Dog;
      editDogNameController = TextEditingController(text: dog!.dogName);
      editDogGenderController = TextEditingController(text: dog!.gender);
      dogSize = dog!.size!;
      isdogLookingFor = dog!.lookingFor!;
    }
    return;
  }
}
