import 'package:dating_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocal(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    print(_locale);
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
