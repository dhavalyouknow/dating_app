import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin SetupProfile3Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController aboutSelfController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  User? user;

  @override
  void initState() {
    super.initState();
  }

  String? descriptionValidator(dynamic description) {
    if (description.isEmpty) {
      return 'Enter about yourself';
    }
    return null;
  }

  onSubmitProfile3() {
    if (formKey.currentState!.validate()) {
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddYourDogNow();
                      },
                    );
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
}
