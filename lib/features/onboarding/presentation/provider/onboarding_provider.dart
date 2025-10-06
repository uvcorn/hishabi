import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  void completeOnboarding() {
    _isCompleted = true;
    notifyListeners();
  }
}
