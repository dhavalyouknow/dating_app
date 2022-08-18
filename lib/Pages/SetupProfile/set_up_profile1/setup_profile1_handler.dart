import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile2/setup_profile2.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin SetupProfile1Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController lengthController = TextEditingController();
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  String selectedClothingStyle = '';
  User? user;
  bool haveDog = false;
  bool haveKids = false;
  final items = List<String>.generate(151, (index) => '$index');
  String currentLength = '';
  String? redirectDirectonMyPage;
  final formKey = GlobalKey<FormState>();
  String isLength = '';
  final lengthFocus = FocusNode();
  List<YesNo> isHaveDogs = [];
  List<YesNo> isHaveKid = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return;
    } else {
      redirectDirectonMyPage =
          ModalRoute.of(context)!.settings.arguments.toString();
    }
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    isHaveDogs = [
      YesNo(name: t.yes, selected: false),
      YesNo(name: t.no, selected: false),
      YesNo(name: t.wishihade, selected: false),
    ];
    isHaveKid = [
      YesNo(name: t.yes, selected: false),
      YesNo(name: t.no, selected: false),
      YesNo(name: 'Bonus', selected: false),
    ];
  }

  KeyboardActionsConfig buildKeyboardActionsConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey,
      actions: [
        KeyboardActionsItem(
          focusNode: lengthFocus,
        ),
      ],
    );
  }

  String? lengthValidator(dynamic length) {
    if (length == 0) {
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

  onSubmitProfile1() {
    print(user);
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
                  length: lengthController.text.isNotEmpty
                      ? int.parse(lengthController.text)
                      : 0,
                ),
                success: (value) {
                  for (var tapped in isHaveDog) {
                    tapped.selected = false;
                  }
                  for (var tapped in isHaveKid) {
                    tapped.selected = false;
                  }
                  // for (var tapped in interestedIn) {
                  //   tapped.selected = false;
                  // }
                  if (redirectDirectonMyPage == null) {
                    Navigator.pushNamed(
                      context,
                      SetupProfile2.routeName,
                    );
                  } else {
                    Navigator.pushNamed(context, SetupProfile2.routeName,
                        arguments: 'redirectDirectonMyPage');
                  }

                  Fluttertoast.showToast(
                    msg: 'Your Profile Setup Successfully',
                    timeInSecForIosWeb: 5,
                  );
                },
                onError: () {
                  print('asa');
                },
              ),
            );
          },
        ),
      );
    }
  }
}
