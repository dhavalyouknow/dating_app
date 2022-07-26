import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('sv'),
  ];
  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'sv':
        return '🇸🇪';
      default:
        return '🇺🇸';
    }
  }
}
