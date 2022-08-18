import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin ClothingWidgetHandlers<T extends StatefulWidget> on State<T> {
  List<String> clothingStyle = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    clothingStyle = [
      t.stylish,
      t.street,
      t.fashionistas,
      t.pimpinett,
      t.minimalism,
      t.neutral,
      t.sporty,
      t.retro,
      t.bohemian,
      t.rock,
      t.rockabilly,
      t.baggie,
      t.mixed,
      t.other,
    ];
  }
}
