import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

mixin SelectGenderHandlers<T extends StatefulWidget> on State<T> {
  String yourGender = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  List<MaleFemale> selectGender = [];

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);

    selectGender = [
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
      MaleFemale(
        name: t.other,
        selected: false,
        icon: const Icon(Icons.transgender),
      ),
    ];
  }
}
