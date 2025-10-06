import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/usecases/get_statistics_use_case.dart';

class StatisticsProvider extends ChangeNotifier {
  final GetStatisticsUseCase getStatisticsUseCase;

  StatisticsProvider(this.getStatisticsUseCase);

  List<TransactionEntity> _transactions = [];
  List<TransactionEntity> get transactions => _transactions;
  List<double> monthlyExpenses = [300, 500, 200, 450, 700, 600];

  List<FlSpot> get expenseSpots {
    return List.generate(
      monthlyExpenses.length,
      (index) => FlSpot(index.toDouble(), monthlyExpenses[index]),
    );
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadTransactions() async {
    _isLoading = true;
    notifyListeners();

    _transactions = await getStatisticsUseCase();
    _isLoading = false;
    notifyListeners();
  }
}
