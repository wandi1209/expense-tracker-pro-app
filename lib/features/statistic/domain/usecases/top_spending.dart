import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class TopSpending {
  final StatisticRepository statisticRepository;
  final bool top;

  TopSpending({required this.statisticRepository, required this.top});

  Future<List<Transaction>> execute() async {
    return await statisticRepository.topSpending(top);
  }
}
