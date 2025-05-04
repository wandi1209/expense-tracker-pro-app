import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

abstract class StatisticRepository {
  Future<List<Transaction>> getTransactionByFilter(DateFilter dateFilter);
  Future<List<Transaction>> topSpending(bool top);
}
