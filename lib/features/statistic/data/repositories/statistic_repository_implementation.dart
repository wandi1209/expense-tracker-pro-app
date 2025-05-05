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
    String type,
  ) async {
    var allTransactions = await transactioRemoteDatasource.getTransactions();
    final DateTime now = DateTime.now();

    return allTransactions.where((tx) {
      final txDate = tx.createdAt;

      // Filter berdasarkan waktu
      bool isInDateRange;
      switch (dateFilter) {
        case DateFilter.day:
          isInDateRange =
              txDate.year == now.year &&
              txDate.month == now.month &&
              txDate.day == now.day;
          break;
        case DateFilter.week:
          final weekStart = now.subtract(Duration(days: now.weekday - 1));
          final weekEnd = weekStart.add(const Duration(days: 6));
          isInDateRange =
              txDate.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
              txDate.isBefore(weekEnd.add(const Duration(days: 1)));
          break;
        case DateFilter.month:
          isInDateRange = txDate.year == now.year && txDate.month == now.month;
          break;
        case DateFilter.year:
          isInDateRange = txDate.year == now.year;
          break;
      }

      // Filter berdasarkan tipe
      bool isTypeMatch = tx.transactionType == type;

      return isInDateRange && isTypeMatch;
    }).toList();
  }

  @override
  Future<List<Transaction>> topSpending(bool top, String type) async {
    var allTransactions = await transactioRemoteDatasource.getTransactions();

    var filteredTransactions =
        allTransactions.where((tx) {
          return tx.transactionType == type;
        }).toList();

    filteredTransactions.sort((a, b) => b.amount.compareTo(a.amount));

    if (top) {
      return filteredTransactions.take(5).toList();
    } else {
      return filteredTransactions.reversed.take(5).toList();
    }
  }
}
