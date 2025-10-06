import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  double _balance = 2500.00;
  double _income = 3000.00;
  double _expense = 500.00;

  double get balance => _balance;
  double get income => _income;
  double get expense => _expense;

  void updateBalance(double newBalance) {
    _balance = newBalance;
    notifyListeners();
  }

  void updateIncome(double newIncome) {
    _income = newIncome;
    notifyListeners();
  }

  void updateExpense(double newExpense) {
    _expense = newExpense;
    notifyListeners();
  }
}
