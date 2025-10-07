class StatisticsTransaction {
  final String id;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final String category;

  StatisticsTransaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}

enum TransactionType { income, expense }
