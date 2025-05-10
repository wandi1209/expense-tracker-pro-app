import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class GetTransactionByFilter {
  final StatisticRepository statisticRepository;
  GetTransactionByFilter({required this.statisticRepository});

  Future<List<Transaction>> execute(DateFilter dateFilter, String type) async {
    return await statisticRepository.getTransactionByFilter(dateFilter, type);
  }
}
