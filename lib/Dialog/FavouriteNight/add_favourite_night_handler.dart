import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin AddNightModuleHandlers<T extends StatefulWidget> on State<T> {
  List<dynamic> selectedNights = [];
  List<String> favouriteNights = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    favouriteNights = [
      t.fridaycoziness,
      t.meetfriends,
      t.familytime,
      t.tacosnight,
      t.hundmingel,
      t.eatingout,
      t.youtube,
      t.concert,
      t.cinema,
      t.nightlifeparty,
      t.watchseries,
      t.operatheater,
      t.readbooks,
      t.barpub,
      t.gotoaconcert,
      t.takeaglass,
      t.dinnerparties,
      t.sportevents,
      t.events,
      t.karaoke,
    ];
  }
}
