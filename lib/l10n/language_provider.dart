import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('bn'); // Default language

  Locale get locale => _locale;

  void changeLanguage(String languageCode) {
    _locale = Locale(languageCode, '');
    notifyListeners();
  }
}
