import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class GetTransaction {
  final TransactionRepository transactionRepository;

  GetTransaction({required this.transactionRepository});

  Future<List<TransactionModel>> execute() async {
    return await transactionRepository.getTransactions();
  }
}
