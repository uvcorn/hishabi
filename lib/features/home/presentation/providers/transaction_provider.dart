import 'package:flutter/material.dart';
import 'package:hishabi/features/home/domain/entities/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = <Transaction>[
    Transaction(title: 'Upwork', amount: 850.0, date: 'Today', isIncome: true),
    Transaction(
      title: 'Groceries',
      amount: 50.0,
      date: 'Yesterday',
      isIncome: false,
    ),
    Transaction(
      title: 'Netflix',
      amount: 15.0,
      date: 'Last week',
      isIncome: false,
    ),
    Transaction(
      title: 'Groceries',
      amount: 50.0,
      date: 'Last week',
      isIncome: false,
    ),
    Transaction(
      title: 'Netflix',
      amount: 15.0,
      date: 'Last week',
      isIncome: false,
    ),
    Transaction(
      title: 'Netflix',
      amount: 15.0,
      date: 'Last week',
      isIncome: false,
    ),
    Transaction(
      title: 'Netflix',
      amount: 15.0,
      date: 'Last week',
      isIncome: false,
    ),
  ];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }

  double get totalBalance {
    double income = _transactions
        .where((tx) => tx.isIncome)
        .fold(0, (sum, tx) => sum + tx.amount);
    double expense = _transactions
        .where((tx) => !tx.isIncome)
        .fold(0, (sum, tx) => sum + tx.amount);
    return income - expense;
  }
}
