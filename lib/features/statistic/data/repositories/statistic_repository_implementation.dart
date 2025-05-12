import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

class StatisticRepositoryImplementation extends StatisticRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;

  StatisticRepositoryImplementation({
    required this.transactionRemoteDatasource,
  });

  @override
  Future<List<TransactionModel>> getTransactionByFilter(
    DateFilter dateFilter,
    String type,
  ) async {
    var allTransactions = await transactionRemoteDatasource.getTransactions();
    final DateTime now = DateTime.now();

    return allTransactions.where((tx) {
      final txDate = tx.createdAt;

      bool isInDateRange;
      switch (dateFilter) {
        case DateFilter.week:
          final weekStart = now.subtract(Duration(days: now.weekday - 1));
          final weekEnd = weekStart.add(const Duration(days: 6));
          isInDateRange =
              txDate.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
              txDate.isBefore(weekEnd.add(const Duration(days: 1)));
          break;
        case DateFilter.year:
          isInDateRange = txDate.year == now.year;
          break;
      }

      bool isTypeMatch = tx.transactionType == type;

      return isInDateRange && isTypeMatch;
    }).toList();
  }

  @override
  Future<List<TransactionModel>> topSpending(bool top, String type) async {
    var allTransactions = await transactionRemoteDatasource.getTransactions();

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
