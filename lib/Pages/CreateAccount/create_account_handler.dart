import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

mixin CreateAccountHandlers<T extends StatefulWidget> on State<T> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

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
    if (email.isEmpty) {
      return 'Enter email';
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
                "gender": genderController.text,
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
  //         success: (User user) {
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
