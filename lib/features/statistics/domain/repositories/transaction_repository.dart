import 'package:hishabi/features/statistics/domain/entities/statistics_transaction.dart';

abstract class TransactionRepository {
  Future<List<StatisticsTransaction>> getStatisticsTransaction(
    DateTime startDate,
    DateTime endDate,
  );
}
