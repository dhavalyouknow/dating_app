import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin EditPersonHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController editFirstNameController = TextEditingController();
  TextEditingController editLastNameController = TextEditingController();
  TextEditingController editAgeController = TextEditingController();
  TextEditingController editAboutSelfController = TextEditingController();
  User? user;
  int index = 0;

  onSaveUserProfile() {
    User user = BlocProvider.of<UserBloc>(context).state.user as User;
    user = user.copyWith(
      firstName: editFirstNameController.text,
      lastName: editLastNameController.text,
      aboutSelf: editAboutSelfController.text,
    );
    BlocProvider.of<UserBloc>(context).add(
      UpdateUserEvent(
        user: user,
        success: (value) {
          Fluttertoast.showToast(msg: 'Your Profile Updated Successfully');
          Navigator.pushReplacementNamed(
              context, PersonPublicProfile.routeName);
        },
      ),
    );
  }
}
