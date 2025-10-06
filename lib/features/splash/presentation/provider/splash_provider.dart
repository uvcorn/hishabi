import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  bool isDone = false;
  Future<void> initializeSplash({required VoidCallback onComplete}) async {
    await Future.delayed(const Duration(seconds: 3));
    isDone = true;
    notifyListeners();
    onComplete();
  }
}
