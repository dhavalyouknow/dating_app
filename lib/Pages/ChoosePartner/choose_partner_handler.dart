import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/UploadProfile/upload_profile.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin ChoosePartnerHandlers<T extends StatefulWidget> on State<T> {
  List<String> imSearchingFor = [];
  final formKey = GlobalKey<FormState>();
  User? user;
  List<ChoosePartner> searchingFor = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    searchingFor = [
      ChoosePartner(
        name: t.dogWalks,
        selected: false,
        image: Image.asset("assets/searchingForIcon/dog_walksIcon.png"),
      ),
      ChoosePartner(
        name: t.partner,
        selected: false,
        image: Image.asset("assets/searchingForIcon/PartnerIcon.png"),
      ),
      ChoosePartner(
        name: t.friends,
        selected: false,
        image: Image.asset("assets/searchingForIcon/FriendsIcon.png"),
      ),
    ];
  }

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
                onError: () {},
              ),
            );
          },
        ),
      );
    }
  }
}
