import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile3/setup_profile3.dart';
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
                  Navigator.pushNamed(context, SetupProfile3.routeName);
                },
              ),
            );
          },
        ),
      );
    }
  }

  // Padding(
  // padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
  // child: Container(
  // width: double.infinity,
  // height: 45.h,
  // decoration: BoxDecoration(
  // borderRadius: BorderRadius.circular(10),
  // gradient: const LinearGradient(
  // begin: Alignment.topRight,
  // end: Alignment.bottomLeft,
  // colors: [
  // Color(0xffFFE3E9),
  // Color(0xffFAC7D1),
  // Color(0xffFFBCC9),
  // ],
  // ),
  // boxShadow: const [
  // BoxShadow(
  // color: Color(0xffFFBCC9),
  // spreadRadius: 3,
  // blurRadius: 26.0,
  // offset: Offset(5, 5),
  // ),
  // ],
  // ),
  // child: FloatingActionButton(
  // onPressed: () {
  // onSubmitProfile2();
  // },
  // shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(22),
  // ),
  // backgroundColor: Colors.transparent,
  // elevation: 0.0,
  // child: const Text(
  // 'Next',
  // style: TextStyle(
  // color: AppStyles.whiteColor,
  // ),
  // ),
  // ),
  // ),
  // ),
}
