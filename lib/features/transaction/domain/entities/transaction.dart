import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String userId;
  final int amount;
  final String transactionType;
  final String remarks;
  final DateTime createdAt;

  const Transaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.transactionType,
    required this.remarks,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    amount,
    transactionType,
    remarks,
    createdAt,
  ];
}
