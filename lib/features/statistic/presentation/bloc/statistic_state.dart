part of 'statistic_bloc.dart';

abstract class StatisticState extends Equatable {}

class StatisticInitial extends StatisticState {
  @override
  List<Object?> get props => [];
}

class StatisticEventLoading extends StatisticState {
  @override
  List<Object?> get props => [];
}

class StatisticGetByFilterSuccess extends StatisticState {
  final List<TransactionModel> transactions;

  StatisticGetByFilterSuccess({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class StatisticGetTopTransactionsSuccess extends StatisticState {
  final List<TransactionModel> topTransactions;

  StatisticGetTopTransactionsSuccess({required this.topTransactions});

  @override
  List<Object?> get props => [topTransactions];
}

class StatisticEventFailure extends StatisticState {
  final String error;

  StatisticEventFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
