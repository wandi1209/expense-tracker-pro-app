import 'package:expense_tracker_pro/core/respons/response_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class EditTransaction {
  final TransactionRepository transactionRepository;

  EditTransaction({required this.transactionRepository});

  Future<ResponseModel> execute(
    String id,
    int amount,
    String transactionType,
  ) async {
    return await transactionRepository.editTransaction(
      id,
      amount,
      transactionType,
    );
  }
}
