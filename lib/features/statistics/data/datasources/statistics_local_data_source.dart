import '../models/transaction_model.dart';

class StatisticsLocalDataSource {
  Future<List<TransactionModel>> fetchTransactions() async {
    await Future.delayed(const Duration(seconds: 1)); // mock delay
    return [
      TransactionModel(
        title: "Starbucks",
        date: "Jan 12, 2022",
        amount: 150.0,
        isExpense: true,
        icon: "assets/icons/starbucks.png",
      ),
      TransactionModel(
        title: "Transfer",
        date: "Yesterday",
        amount: 85.0,
        isExpense: true,
        icon: "assets/icons/user.png",
      ),
      TransactionModel(
        title: "Youtube",
        date: "Today",
        amount: 11.99,
        isExpense: true,
        icon: "assets/icons/youtube.png",
      ),
    ];
  }
}
