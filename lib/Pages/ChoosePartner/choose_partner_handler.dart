import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/UploadProfile/upload_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ChoosePartnerHandlers<T extends StatefulWidget> on State<T> {
  List<String> imSearchingFor = [];
  final formKey = GlobalKey<FormState>();
  User? user;

  onSearchingFor() {
    if (user == null) {
      BlocProvider.of<AuthBloc>(context).add(
        SessionRequest(
          onSuccess: (user) {
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user.copyWith(
                  searchingFor: imSearchingFor,
                ),
                success: (value) {
                  Navigator.pushReplacementNamed(
                      context, UploadProfile.routeName);
                },
              ),
            );
          },
        ),
      );
    }
  }
}

class ChoosePartner {
  String name;
  bool selected;
  Image image;

  ChoosePartner({
    required this.name,
    required this.selected,
    required this.image,
  });
}

List<ChoosePartner> searchingFor = [
  ChoosePartner(
    name: "Dog Walks",
    selected: false,
    image: Image.asset("assets/searchingForIcon/dog_walksIcon.png"),
  ),
  ChoosePartner(
    name: "Partner",
    selected: false,
    image: Image.asset("assets/searchingForIcon/PartnerIcon.png"),
  ),
  ChoosePartner(
    name: "Friends",
    selected: false,
    image: Image.asset("assets/searchingForIcon/FriendsIcon.png"),
  ),
];
