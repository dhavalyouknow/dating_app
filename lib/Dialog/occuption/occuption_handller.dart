import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin OccuptionHandlers<T extends StatefulWidget> on State<T> {
  String selectedOccupation = '';
  List<String> occupations = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    occupations = [
      t.working,
      t.influencer,
      t.studying,
      t.betweenjobs,
      t.entrepreneur,
      t.freelancer,
      t.pensioner,
      t.other
    ];
  }
}
