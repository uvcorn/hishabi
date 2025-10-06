import 'package:hisabi/features/statistics/domain/entities/transaction_entity.dart';

abstract class StatisticsRepository {
  Future<List<TransactionEntity>> getTransactions();
}
