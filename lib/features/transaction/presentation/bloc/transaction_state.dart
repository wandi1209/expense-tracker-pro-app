part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {}

class TransactionInitial extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionLoading extends TransactionState {
  @override
  List<Object?> get props => [];
}

class GetTransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  GetTransactionSuccess({required this.transactions});
  @override
  List<Object?> get props => [transactions];
}

class GetDetailTransaction extends TransactionState {
  final TransactionModel transaction;

  GetDetailTransaction({required this.transaction});
  @override
  List<Object?> get props => [transaction];
}

class AddTransactionSuccess extends TransactionState {
  final String message;

  AddTransactionSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class EditTransactionSucces extends TransactionState {
  final String message;

  EditTransactionSucces({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeleteTransactionSuccess extends TransactionState {
  final String message;

  DeleteTransactionSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class TransactionFailure extends TransactionState {
  final String error;

  TransactionFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
