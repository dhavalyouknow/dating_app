import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SetupProfile2Handlers<T extends StatefulWidget> on State<T> {
  List<String> interestedName = [];
  List<String> favNights = [];
  List<String> activities = [];
  User? user;

  @override
  void initState() {
    super.initState();
  }

  onSubmitProfile2() {
    if (user == null) {
      BlocProvider.of<AuthBloc>(context).add(
        SessionRequest(
          onSuccess: (user) {
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user.copyWith(
                  interests: interestedName,
                  favouriteNight: favNights,
                  activity: activities,
                ),
                success: (value) {
                  Navigator.pushNamed(context, "/SetupProfile3");
                },
              ),
            );
          },
        ),
      );
    }
  }
}
