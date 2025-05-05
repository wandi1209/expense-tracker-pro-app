import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class GetTransactionByFilter {
  final StatisticRepository statisticRepository;
  final DateFilter dateFilter;
  final String type;

  GetTransactionByFilter({
    required this.statisticRepository,
    required this.dateFilter,
    required this.type,
  });

  Future<List<Transaction>> execute() async {
    return await statisticRepository.getTransactionByFilter(dateFilter, type);
  }
}
