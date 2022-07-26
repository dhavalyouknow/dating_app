import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile2/setup_profile2.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

mixin SetupProfile1Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController lengthController = TextEditingController();
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  User? user;
  bool haveDog = false;
  bool haveKids = false;

  int currentLength = 0;

  final formKey = GlobalKey<FormState>();

  String? lengthValidator(dynamic length) {
    if (length.isEmpty) {
      return 'Enter Length';
    }
    return null;
  }

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

  // Future<void> selectDate(BuildContext context) async {
  //   NumberPicker levelPicker = NumberPicker.integer(
  //       initialValue: _currentLevel,
  //       minValue: 0,
  //       maxValue: 100,
  //       step: 1,
  //       onChanged: (num) {
  //         setState(() {
  //           _currentLevel = num;
  //           _saveLevel(num);
  //         });
  //       });
  //
  //   if (datePicked != null && datePicked != selectedDate) {
  //     setState(() {
  //       selectedDate = datePicked;
  //     });
  //   }
  // }

  //
  //   // if (datePicked != null && datePicked != selectedDate) {
  //   //   setState(() {
  //   //     selectedDate = datePicked;
  //   //   });
  //   // }
  // }

  onSubmitProfile1() {
    if (formKey.currentState!.validate()) {
      if (user == null) {
        BlocProvider.of<AuthBloc>(context).add(
          SessionRequest(
            onSuccess: (user) {
              BlocProvider.of<UserBloc>(context).add(
                UpdateUserEvent(
                  user: user.copyWith(
                    haveDog: haveDog,
                    relationshipStatus: selectedStatus,
                    interestedIn: selectedInterestedIn,
                    occupation: selectedOccupation,
                    eyeColor: selectedEyeColor,
                    haveKids: haveKids,
                    length: int.parse(lengthController.text),
                  ),
                  success: (value) {
                    Navigator.pushNamed(context, SetupProfile2.routeName);
                    Fluttertoast.showToast(
                        msg: 'Your Profile Setup Successfully');
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
