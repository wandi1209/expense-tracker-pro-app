import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

abstract class StatisticRepository {
  Future<List<TransactionModel>> getTransactionByFilter(
    DateFilter dateFilter,
    String type,
  );
  Future<List<TransactionModel>> topSpending(bool top, String type);
}
