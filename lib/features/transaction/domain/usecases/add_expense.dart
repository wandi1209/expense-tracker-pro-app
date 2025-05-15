import '../../../../core/respons/response_model.dart';
import '../repositories/transaction_repository.dart';

class AddExpense {
  final TransactionRepository transactionRepository;

  AddExpense({required this.transactionRepository});

  Future<ResponseModel> execute(double amount, String remarks) async {
    return await transactionRepository.addExpense(amount, remarks);
  }
}
