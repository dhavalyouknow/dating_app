import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin MyPageHandlers<T extends StatefulWidget> on State<T> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(
      SessionRequest(
        onSuccess: (user) {
          print(user);
          BlocProvider.of<UserBloc>(context).add(SetUser(user: user));
          this.user = user;
        },
      ),
    );
    if (mounted) {
      setState(() {});
    }
  }
}
