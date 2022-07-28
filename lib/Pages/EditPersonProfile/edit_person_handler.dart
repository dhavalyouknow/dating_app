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
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  String currentLength = '';
  bool haveDog = false;
  bool haveKids = false;
  List<dynamic> interests = [];
  List<dynamic> nights = [];
  List<dynamic> activities = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    User user = BlocProvider.of<UserBloc>(context).state.user as User;
    editFirstNameController = TextEditingController(text: user.firstName);
    editLastNameController = TextEditingController(text: user.lastName);
    editAboutSelfController = TextEditingController(text: user.aboutSelf);
  }

  onSaveUserProfile() {
    User user = BlocProvider.of<UserBloc>(context).state.user as User;
    user = user.copyWith(
      firstName: editFirstNameController.text,
      lastName: editLastNameController.text,
      aboutSelf: editAboutSelfController.text,
      haveDog: haveDog,
      relationshipStatus: selectedStatus,
      interestedIn: selectedInterestedIn,
      haveKids: haveKids,
      occupation: selectedOccupation,
      eyeColor: selectedEyeColor,
      length: 2,
      interests: interests,
      favouriteNight: nights,
      activity: activities,
    );
    BlocProvider.of<UserBloc>(context).add(
      UpdateUserEvent(
        user: user,
        success: (value) {
          Fluttertoast.showToast(msg: 'Your Profile Updated Successfully');
          Navigator.pushReplacementNamed(context, '/MyPage');
        },
      ),
    );
  }
}
