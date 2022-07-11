import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin SetupProfile3Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController aboutSelfController = TextEditingController();

  User? user;

  @override
  void initState() {
    super.initState();
  }

  onSubmitProfile3() {
    if (user == null) {
      BlocProvider.of<AuthBloc>(context).add(
        SessionRequest(
          onSuccess: (user) {
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user.copyWith(
                  aboutSelf: aboutSelfController.text,
                ),
                success: (value) {
                  print(value);
                  Navigator.pushNamed(context, "/HomePage");
                  Fluttertoast.showToast(msg: 'SetUp Profile Done');
                },
              ),
            );
          },
        ),
      );
    }
  }
}
