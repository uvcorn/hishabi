import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.title,
    required super.date,
    required super.amount,
    required super.isExpense,
    required super.icon,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'],
      date: json['date'],
      amount: json['amount'],
      isExpense: json['isExpense'],
      icon: json['icon'],
    );
  }
}
