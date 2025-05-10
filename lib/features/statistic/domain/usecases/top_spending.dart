import 'package:expense_tracker_pro/features/statistic/domain/repositories/statistic_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class TopSpending {
  final StatisticRepository statisticRepository;

  TopSpending({required this.statisticRepository});

  Future<List<Transaction>> execute(bool top, String type) async {
    return await statisticRepository.topSpending(top, type);
  }
}
