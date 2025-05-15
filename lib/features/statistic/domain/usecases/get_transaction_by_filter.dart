import '../../../../core/utils/enum.dart';
import '../repositories/statistic_repository.dart';
import '../../../transaction/data/models/transaction_model.dart';

class GetTransactionByFilter {
  final StatisticRepository statisticRepository;
  GetTransactionByFilter({required this.statisticRepository});

  Future<List<TransactionModel>> execute(DateFilter dateFilter, String type) async {
    return await statisticRepository.getTransactionByFilter(dateFilter, type);
  }
}
