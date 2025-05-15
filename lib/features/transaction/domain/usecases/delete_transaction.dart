import '../../../../core/respons/response_model.dart';
import '../repositories/transaction_repository.dart';

class DeleteTransaction {
  final TransactionRepository transactionRepository;

  DeleteTransaction({required this.transactionRepository});

  Future<ResponseModel> execute(String id) async {
    return await transactionRepository.deleteTransaction(id);
  }
}
