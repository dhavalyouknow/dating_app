import 'package:dating_app/l10n/l10n.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalProvider>(context);
    final locale = provider.locale ?? const Locale('en');
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: locale,
            icon: Container(width: 12),
            items: L10n.all.map(
              (locale) {
                final flag = L10n.getFlag(locale.languageCode);

                return DropdownMenuItem(
                  value: locale,
                  onTap: () {
                    final provider =
                        Provider.of<LocalProvider>(context, listen: false);
                    provider.setLocal(locale);
                  },
                  child: Center(
                    child: Text(
                      flag,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
