import '../../../../core/utils/enum.dart';
import '../../../transaction/data/models/transaction_model.dart';

abstract class StatisticRepository {
  Future<List<TransactionModel>> getTransactionByFilter(
    DateFilter dateFilter,
    String type,
  );
  Future<List<TransactionModel>> topSpending(bool top, String type);
}
