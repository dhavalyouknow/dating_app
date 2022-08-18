import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/EditEmail/edit_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin EditEmailHandler<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController editEmailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();
  bool isLoading = false;
  User? user;

  @override
  void initState() {
    super.initState();
    user = BlocProvider.of<UserBloc>(context).state.user;
  }

  String? emailValidator(dynamic email) {
    if (email.isEmpty) {
      return 'Enter email';
    }
    return null;
  }

  String? repeatEmailValidator(dynamic repeatEmailValidator) {
    if (repeatEmailValidator.isEmpty) {
      return 'Enter email';
    } else if (repeatEmailValidator != editEmailController.text) {
      return 'Not match';
    }
    return null;
  }

  editEmail() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('auth_token');
    user = user?.copyWith(email: confirmEmailController.text);
    Future.delayed(
      const Duration(seconds: 0),
      () {
        BlocProvider.of<UserBloc>(context).add(
          UpdateUserEvent(
            user: user!,
            success: (success) {
              BlocProvider.of<UserBloc>(context).add(
                ResendEmail(
                  headerToken: token!,
                  onSuccess: () {
                    Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .yourresetemailhasbeensuccessfullysent,
                      timeInSecForIosWeb: 5,
                    );
                    setState(() {
                      isLoading = false;
                    });

                    Navigator.pushReplacementNamed(
                      context,
                      EditEmail.routeName,
                    );
                  },
                  onError: () {
                    setState(() {
                      isLoading = false;
                    });
                    Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .thisemailaddressisalreadyassociatedwithanotheraccountpleaseuseadifferentemailaddress,
                      timeInSecForIosWeb: 5,
                    );
                  },
                ),
              );
            },
            onError: () {
              setState(() {
                isLoading = false;
              });
              Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!
                    .thisemailaddressisalreadyassociatedwithanotheraccountpleaseuseadifferentemailaddress,
                timeInSecForIosWeb: 5,
              );
            },
          ),
        );
      },
    );
  }
}
