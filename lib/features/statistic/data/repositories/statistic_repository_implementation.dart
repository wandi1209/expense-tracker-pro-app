import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class StatisticRepositoryImplementation extends StatisticRepository {
  final TransactioRemoteDatasource transactioRemoteDatasource;

  StatisticRepositoryImplementation({required this.transactioRemoteDatasource});
  @override
  Future<List<Transaction>> getTransactionByFilter(
    DateFilter dateFilter,
  ) async {
    var allTransactions = await transactioRemoteDatasource.getTransactions();
    final DateTime now = DateTime.now();

    return allTransactions.where((tx) {
      final txDate = tx.createdAt;

      switch (dateFilter) {
        case DateFilter.day:
          return txDate.year == now.year &&
              txDate.month == now.month &&
              txDate.day == now.day;
        case DateFilter.week:
          final thisWeekStart = now.subtract(Duration(days: now.weekday - 1));
          final thisWeekEnd = thisWeekStart.add(const Duration(days: 6));
          return txDate.isAfter(
                thisWeekStart.subtract(const Duration(seconds: 1)),
              ) &&
              txDate.isBefore(thisWeekEnd.add(const Duration(days: 1)));
        case DateFilter.month:
          return txDate.year == now.year && txDate.month == now.month;
        case DateFilter.year:
          return txDate.year == now.year;
      }
    }).toList();
  }

  @override
  Future<List<Transaction>> topSpending(bool top) async {
    var allTransactions = await transactioRemoteDatasource.getTransactions();

    allTransactions.sort((a, b) => b.amount.compareTo(a.amount));

    if (top) {
      return allTransactions.take(5).toList();
    } else {
      return allTransactions.reversed.take(5).toList();
    }
  }
}
