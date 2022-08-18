import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin EyeColorHandlers<T extends StatefulWidget> on State<T> {
  String selectedEyeColor = '';
  List<String> eyeColor = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    eyeColor = [
      t.black,
      t.darkbrown,
      t.brown,
      t.nutbrown,
      t.green,
      t.grey,
      t.blue,
      t.lightblue,
      t.mottled,
    ];
  }
}
