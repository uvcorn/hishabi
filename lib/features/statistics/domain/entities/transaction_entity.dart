class TransactionEntity {
  final String title;
  final String date;
  final double amount;
  final bool isExpense;
  final String icon;

  TransactionEntity({
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
    required this.icon,
  });
}
