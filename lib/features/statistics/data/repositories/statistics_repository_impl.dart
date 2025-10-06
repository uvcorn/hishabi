import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/statistics_repository.dart';
import '../datasources/statistics_local_data_source.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  final StatisticsLocalDataSource localDataSource;

  StatisticsRepositoryImpl(this.localDataSource);

  @override
  Future<List<TransactionEntity>> getTransactions() {
    return localDataSource.fetchTransactions();
  }
}
