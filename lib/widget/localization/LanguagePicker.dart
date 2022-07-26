import 'package:dating_app/l10n/l10n.dart';
import 'package:dating_app/language_provider/lannguagePro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...L10n.all.map((e) {
            final flag = L10n.getFlag(e.languageCode);
            return GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<LocalProvider>(context, listen: false);
                provider.setLocal(e);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    flag,
                    style: TextStyle(fontSize: 30.sp),
                  ),
                  if (e.languageCode == 'en')
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: const Text('vs'),
                    )
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
