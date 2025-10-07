import 'package:flutter/material.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/language_provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final current = provider.locale.languageCode;

    final languages = {'en': 'english'.tr, 'bn': 'bengali'.tr};

    return Scaffold(
      appBar: AppBar(title: Text('select_language'.tr)),
      body: ListView(
        children: languages.entries.map((entry) {
          return RadioListTile<String>(
            title: Text(entry.value),
            value: entry.key,
            groupValue: current,
            onChanged: (val) => provider.changeLanguage(val!),
          );
        }).toList(),
      ),
    );
  }
}
