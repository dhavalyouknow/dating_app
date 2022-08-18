import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/ChooseDogPicture/choose_dog_picture.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin AddYourDogHandlers<T extends StatefulWidget> on State<T> {
  TextEditingController dogNameController = TextEditingController();
  String selectedDogSize = "";
  String selectedDogGender = "";
  List<String> myDogLookingFor = [];
  User? user;
  final formKey = GlobalKey<FormState>();
  List<MaleFemale> selectDogGender = [];
  List<DogSize> dogLookingFors = [];
  List<DogSize> sizeOfDogs = [];

  String? dogNameValidator(dynamic dogName) {
    if (dogName.isEmpty) {
      return 'Enter Dog Name';
    }
    return null;
  }

  @override
  initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(SessionRequest(onSuccess: (user) {
      this.user = user;
    }));
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    selectDogGender = [
      MaleFemale(
        name: t.male,
        selected: false,
        icon: const Icon(Icons.male),
      ),
      MaleFemale(
        name: t.female,
        selected: false,
        icon: const Icon(Icons.female),
      ),
    ];
    sizeOfDogs = [
      DogSize(name: t.big, selected: false),
      DogSize(name: t.medium, selected: false),
      DogSize(name: t.small, selected: false),
      DogSize(name: t.mini, selected: false),
      DogSize(name: t.micro, selected: false),
    ];

    dogLookingFors = [
      DogSize(name: t.friends, selected: false),
      DogSize(name: t.nanny, selected: false),
      DogSize(name: t.bonusfather, selected: false),
      DogSize(name: t.bonusmother, selected: false),
    ];
  }

  onSubmitDog() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<DogBloc>(context).add(
        AddDogEvent(
          dogName: dogNameController.text,
          gender: selectedDogGender,
          size: selectedDogSize,
          lookingFor: myDogLookingFor,
          id: user!.id!,
          onSuccess: (dog) {
            print('DOG -> $dog');
            user = user?.copyWith(dog: [...?user?.dog, dog]);
            BlocProvider.of<UserBloc>(context).add(SetUser(user: user!));
            print(user?.dog!.length);
            Navigator.pushReplacementNamed(context, ChooseDogPicture.routeName);
            for (var tapped in sizeOfDogs) {
              tapped.selected = false;
            }
            for (var tapped in selectDogGender) {
              tapped.selected = false;
            }
          },
        ),
      );
    }
  }
}
