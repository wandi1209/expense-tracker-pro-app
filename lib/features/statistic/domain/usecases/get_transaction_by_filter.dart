import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

class GetTransactionByFilter {
  final StatisticRepository statisticRepository;
  GetTransactionByFilter({required this.statisticRepository});

  Future<List<TransactionModel>> execute(DateFilter dateFilter, String type) async {
    return await statisticRepository.getTransactionByFilter(dateFilter, type);
  }
}
