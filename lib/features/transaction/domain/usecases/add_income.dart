import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class AddIncome {
  final TransactionRepository transactionRepository;

  AddIncome({required this.transactionRepository});

  Future<Map<String, dynamic>> addIncome(int amount, String remarks) async {
    return await transactionRepository.addIncome(amount, remarks);
  }
}
