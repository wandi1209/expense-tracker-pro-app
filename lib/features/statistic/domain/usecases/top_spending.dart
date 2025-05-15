import '../repositories/statistic_repository.dart';
import '../../../transaction/data/models/transaction_model.dart';

class TopSpending {
  final StatisticRepository statisticRepository;

  TopSpending({required this.statisticRepository});

  Future<List<TransactionModel>> execute(bool top, String type) async {
    return await statisticRepository.topSpending(top, type);
  }
}
