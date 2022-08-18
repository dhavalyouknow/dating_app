import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_dialog.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin SetupProfile3Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController aboutSelfController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? redirectDirectonMyPage;
  User? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return;
    } else {
      redirectDirectonMyPage =
          ModalRoute.of(context)!.settings.arguments.toString();
    }
  }

  String? descriptionValidator(dynamic description) {
    if (description.isEmpty) {
      return 'Enter about yourself';
    }
    return null;
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
                  if (redirectDirectonMyPage == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddYourDogNow();
                      },
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, MyPage.routeName);
                  }

                  Fluttertoast.showToast(
                    msg: 'SetUp Profile Done',
                    timeInSecForIosWeb: 3,
                  );
                },
                onError: () {},
              ),
            );
          },
        ),
      );
    }
  }
}
