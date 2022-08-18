import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin ActivityHandlers<T extends StatefulWidget> on State<T> {
  List<dynamic> selectedActivities = [];
  List<String> activities = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    activities = [
      t.yoga,
      t.padel,
      t.bikeridewiththedog,
      t.walk,
      t.golf,
      t.dance,
      t.motocross,
      t.tennis,
      t.gobyboat,
      t.skating,
      t.dogswim,
      t.running,
      t.riding,
      t.joggingwiththedog,
      t.workoutatgym,
      t.hiking,
      t.motorsport,
      t.hunting,
      t.diving,
      t.parachuting,
      t.meditation,
      t.surfing,
      t.fishing,
      t.football,
      t.climbing,
      t.swimming,
      t.skiingsnowboarding,
      t.paddleboard,
      t.badminton,
      t.hockey,
    ];
  }
}
