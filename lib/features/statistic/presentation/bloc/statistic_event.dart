part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {}

class StatisticEventGetTransactionsByFilter extends StatisticEvent {
  final List<TransactionModel> transactions;

  StatisticEventGetTransactionsByFilter({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class StatisticEventGetTopTransactions extends StatisticEvent {
  final List<TransactionModel> transactions;

  StatisticEventGetTopTransactions({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}
