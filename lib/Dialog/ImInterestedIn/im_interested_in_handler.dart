import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin ImInterestedInHandlers<T extends StatefulWidget> on State<T> {
  String selectedInterestedIn = '';
  List<InterestGender> selectedInterestedName = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    selectedInterestedName = [
      InterestGender(interest: t.men, selected: false),
      InterestGender(interest: t.women, selected: false),
      InterestGender(interest: t.both, selected: false),
    ];
  }
}
