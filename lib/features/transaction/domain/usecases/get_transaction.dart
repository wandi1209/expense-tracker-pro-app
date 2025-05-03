import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class GetTransaction {
  final TransactionRepository transactionRepository;

  GetTransaction({required this.transactionRepository});

  Future<List<Transaction>> execute() async {
    return await transactionRepository.getTransactions();
  }
}
