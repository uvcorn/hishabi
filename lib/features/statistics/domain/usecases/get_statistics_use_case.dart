import '../entities/transaction_entity.dart';
import '../repositories/statistics_repository.dart';

class GetStatisticsUseCase {
  final StatisticsRepository repository;

  GetStatisticsUseCase(this.repository);

  Future<List<TransactionEntity>> call() => repository.getTransactions();
}
