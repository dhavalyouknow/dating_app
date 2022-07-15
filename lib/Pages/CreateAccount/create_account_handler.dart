import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

mixin CreateAccountHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String selectedGender = '';
  bool tapped = false;
  // Icon selectedIcon;

  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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

  onSubmit() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        DuplicateEvent(
          email: emailController.text,
          onSuccess: () {
            Navigator.pushNamed(
              context,
              "/CreatePassword",
              arguments: {
                "name": nameController.text,
                "surname": surnameController.text,
                "email": emailController.text,
                "gender": selectedGender,
                "dob": selectedDate.toString(),
                "location": locationController.text,
              },
            );
          },
        ),
      );
    }
  }

  // onSignUp() {

  //   if (formKey.currentState!.validate()) {
  //     BlocProvider.of<AuthBloc>(context).add(
  //       SignUpRequest(
  //         name: nameController.text,
  //         surname: surnameController.text,
  //         email: emailController.text,
  //         password: passwordController.text,
  //         repeatPassword: rePasswordController.text,
  //         dob: selectedDate.toString(),
  //         gender: genderController.text,
  //         success: (User Bloc.Auth.user) {
  //           if (kDebugMode) {
  //             print('******success****');
  //           }
  //           Navigator.pushNamed(context, "/HomePage");
  //         },
  //       ),
  //     );
  //   }
  // }
}
