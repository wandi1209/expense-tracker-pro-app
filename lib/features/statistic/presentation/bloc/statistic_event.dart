part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {}

class StatisticEventGetTransactionsByFilter extends StatisticEvent {
  final DateFilter dateFilter;
  final String type;

  StatisticEventGetTransactionsByFilter({
    required this.dateFilter,
    required this.type,
  });

  @override
  List<Object?> get props => [dateFilter, type];
}

class StatisticEventGetTopTransactions extends StatisticEvent {
  final bool top;
  final String type;

  StatisticEventGetTopTransactions({required this.top, required this.type});

  @override
  List<Object?> get props => [top, type];
}
