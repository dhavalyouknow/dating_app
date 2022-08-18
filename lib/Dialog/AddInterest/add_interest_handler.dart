import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin AddInterestsHandlers<T extends StatefulWidget> on State<T> {
  List<dynamic> selectedInterestsName = [];
  List<String> interestLists = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    interestLists = [
      t.blog,
      t.audiobook,
      t.music,
      t.trip,
      t.shopping,
      t.cooking,
      t.brunch,
      t.tvgame,
      t.doglovers,
      t.winetasting,
      t.vlog,
      t.agility,
      t.fashion,
      t.crafts,
      t.vernissage,
      t.photographing,
      t.books,
      t.dogPark,
      t.cava,
      t.nature,
      t.podcast,
      t.film,
      t.policy,
      t.socialmedia,
      t.exercise,
      t.roadtrips,
      t.discoverdogrestaurants,
      t.homedecoration,
      t.foodlovers,
      t.dogclothes,
    ];
  }
}
