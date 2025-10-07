import 'package:flutter/material.dart';
import 'translations/en_translations.dart';
import 'translations/bn_translations.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enTranslations,
    'bn': bnTranslations,
  };

  // Main translation method - takes key and returns translated text
  String tr(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}
