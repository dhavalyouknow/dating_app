import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SetupProfile1Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController lengthController =
      TextEditingController(text: '2');
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  User? user;
  bool haveDog = false;
  bool haveKids = false;

  onHaveDogSubmit(String dog) {
    if (dog.toLowerCase() == 'yes') {
      haveDog = true;
    } else {
      haveDog = false;
    }
  }

  onKidSubmit(String kids) {
    if (kids.toLowerCase() == 'yes') {
      haveKids = true;
    } else {
      haveKids = false;
    }
  }

  onSubmitProfile1() {
    if (user == null) {
      BlocProvider.of<AuthBloc>(context).add(
        SessionRequest(
          onSuccess: (user) {
            user = user.copyWith(
              haveDog: haveDog,
              relationshipStatus: selectedStatus,
              interestedIn: selectedInterestedIn,
              occupation: selectedOccupation,
              eyeColor: selectedEyeColor,
              haveKids: haveKids,
              length: int.parse(lengthController.text),
            );
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user,
                success: (value) {
                  print('***success***');
                },
              ),
            );
            //  Navigator.pushNamed(context, "/SetupProfile2");
          },
        ),
      );
    }
  }
}
