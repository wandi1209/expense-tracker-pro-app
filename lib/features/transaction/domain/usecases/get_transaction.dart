import '../../data/models/transaction_model.dart';
import '../repositories/transaction_repository.dart';

class GetTransaction {
  final TransactionRepository transactionRepository;

  GetTransaction({required this.transactionRepository});

  Future<List<TransactionModel>> execute() async {
    return await transactionRepository.getTransactions();
  }
}
