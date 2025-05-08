import 'package:expense_tracker_pro/core/respons/response_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class DeleteTransaction {
  final TransactionRepository transactionRepository;

  DeleteTransaction({required this.transactionRepository});

  Future<ResponseModel> execute(String id) async {
    return await transactionRepository.deleteTransaction(id);
  }
}
