import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AddYourDogHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController dogNameController = TextEditingController();
  String selectedDogSize = "";
  String selectedDogGender = "";
  List<String> myDogLookingFor = [];

  User? user;

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
    print(selectedDogSize);
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
          print(user?.dog?.length);
          Navigator.pushNamed(context, "/ChooseDogPicture");
        },
      ),
    );
  }
}
