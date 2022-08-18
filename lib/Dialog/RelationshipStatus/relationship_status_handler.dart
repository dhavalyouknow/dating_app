import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin RelationShipStatusHandlers<T extends StatefulWidget> on State<T> {
  String selectedStatus = '';
  List<String> relationShipStatus = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  loadLists() async {
    final provider = Provider.of<LocalProvider>(context);
    Locale locale = provider.locale ?? const Locale('en');
    AppLocalizations t = await AppLocalizations.delegate.load(locale);
    relationShipStatus = [
      t.singel,
      t.cohabiter,
      t.apart,
      t.separated,
      t.divorced,
    ];
  }
}
