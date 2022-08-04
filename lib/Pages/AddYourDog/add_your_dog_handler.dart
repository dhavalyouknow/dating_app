import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/ChooseDogPicture/choose_dog_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AddYourDogHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController dogNameController = TextEditingController();
  String selectedDogSize = "";
  String selectedDogGender = "";
  List<String> myDogLookingFor = [];
  User? user;
  final formKey = GlobalKey<FormState>();

  String? dogNameValidator(dynamic dogName) {
    if (dogName.isEmpty) {
      return 'Enter Dog Name';
    }
    return null;
  }

  @override
  initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(SessionRequest(onSuccess: (user) {
      this.user = user;
    }));
    if (mounted) {
      setState(() {});
    }
  }

  onSubmitDog() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<DogBloc>(context).add(
        AddDogEvent(
          dogName: dogNameController.text,
          gender: selectedDogGender,
          size: selectedDogSize,
          lookingFor: myDogLookingFor,
          id: user!.id!,
          onSuccess: (dog) {
            print('DOG -> $dog');
            user = user?.copyWith(dog: [...?user?.dog, dog]);
            BlocProvider.of<UserBloc>(context).add(SetUser(user: user!));
            print(user?.dog!.length);
            Navigator.pushReplacementNamed(context, ChooseDogPicture.routeName);
            for (var tapped in sizeOfDog) {
              tapped.selected = false;
            }
            for (var tapped in selectDogGender) {
              tapped.selected = false;
            }
          },
        ),
      );
    }
  }
}
