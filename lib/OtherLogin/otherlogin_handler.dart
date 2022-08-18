import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner.dart' as partner;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin OtherLoginHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  String selectedGender = '';
  bool tapped = false;
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  User? user;
  String countryValue = '';
  String? stateValue;
  String? cityValue;

  String? nameValidator(dynamic firstName) {
    if (firstName.isEmpty) {
      return 'Enter firstname';
    }
    return null;
  }

  String? surnameValidator(dynamic lastName) {
    if (lastName.isEmpty) {
      return 'Enter lastname';
    }
    return null;
  }

  String? emailValidator(dynamic email) {
    RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (email.isEmpty) {
      return 'Enter email';
    } else if (!regex.hasMatch(email)) {
      return 'Enter Valid Password';
    }
    return null;
  }

  String? genderValidator(dynamic gender) {
    if (gender.isEmpty) {
      return 'Enter Gender';
    }
    return null;
  }

  String? dobValidator(dynamic gender) {
    if (gender.isEmpty) {
      return 'Enter Gender';
    }
    return null;
  }

  String? locationValidator(dynamic location) {
    if (location.isEmpty) {
      return 'Enter Location';
    }
    return null;
  }

  Future<void> selectDate(BuildContext context) async {
    var datePicked = await DatePicker.showDatePicker(
      context,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime(
          selectedDate.year - 18, selectedDate.month, selectedDate.day),
      theme: const DatePickerTheme(
        backgroundColor: AppStyles.whiteColor,
      ),
    );

    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
      });
    }
  }

  onUpdateUser() {
    user = user?.copyWith(
      firstName: nameController.text,
      lastName: surnameController.text,
      gender: selectedGender,
      dob: selectedDate,
      city: locationController.text,
    );
    BlocProvider.of<UserBloc>(context).add(
      UpdateUserEvent(
        user: user!,
        success: (value) {
          Navigator.pushNamed(context, partner.ChoosePartner.routeName);
        },
        onError: () {
          Fluttertoast.showToast(
              msg:
                  'This email address is already associated with another account. Please use a different email address.');
        },
      ),
    );
  }
}
