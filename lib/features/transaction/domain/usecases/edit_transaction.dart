import '../../../../core/respons/response_model.dart';
import '../repositories/transaction_repository.dart';

class EditTransaction {
  final TransactionRepository transactionRepository;

  EditTransaction({required this.transactionRepository});

  Future<ResponseModel> execute(
    String id,
    double amount,
    String transactionType,
  ) async {
    return await transactionRepository.editTransaction(
      id,
      amount,
      transactionType,
    );
  }
}
