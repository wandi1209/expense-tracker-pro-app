import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class DeleteTransaction {
  final TransactionRepository transactionRepository;

  DeleteTransaction({required this.transactionRepository});

  Future<Map<String, dynamic>> execute(String id) async {
    return await transactionRepository.deleteTransaction(id);
  }
}
