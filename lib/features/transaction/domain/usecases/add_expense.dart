import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class AddExpense {
  final TransactionRepository transactionRepository;

  AddExpense({required this.transactionRepository});

  Future<Map<String, dynamic>> execute(int amount, String remarks) async {
    return await transactionRepository.addIncome(amount, remarks);
  }
}
