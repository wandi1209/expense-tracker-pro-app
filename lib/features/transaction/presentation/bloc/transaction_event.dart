part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {}

class TransactionEventGetTransactions extends TransactionEvent {
  TransactionEventGetTransactions();

  @override
  List<Object?> get props => [];
}

class TransactionEventAddIncome extends TransactionEvent {
  final double amount;
  final String remarks;

  TransactionEventAddIncome({required this.amount, required this.remarks});
  @override
  List<Object?> get props => [amount, remarks];
}

class TransactionEventAddExpense extends TransactionEvent {
  final double amount;
  final String remarks;

  TransactionEventAddExpense({required this.amount, required this.remarks});
  @override
  List<Object?> get props => [amount, remarks];
}

class TransactionEventEdit extends TransactionEvent {
  final String id;
  final double amount;
  final String transactionType;

  TransactionEventEdit({
    required this.id,
    required this.amount,
    required this.transactionType,
  });

  @override
  List<Object?> get props => [id, amount, transactionType];
}

class TransactionEventDelete extends TransactionEvent {
  final String id;

  TransactionEventDelete({required this.id});

  @override
  List<Object?> get props => [id];
}
