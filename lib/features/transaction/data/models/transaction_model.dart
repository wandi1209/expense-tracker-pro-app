import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.userId,
    required super.amount,
    required super.transactionType,
    required super.remarks,
    required super.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> dataJson) {
    return TransactionModel(
      id: dataJson['_id'],
      userId: dataJson['user_id'],
      amount: dataJson['amount'],
      transactionType: dataJson['transaction_field'],
      remarks: dataJson['remarks'],
      createdAt: DateTime.parse(dataJson['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'remarks': remarks};
  }
}
