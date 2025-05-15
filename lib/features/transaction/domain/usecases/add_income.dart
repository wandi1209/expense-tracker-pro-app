import '../../../../core/respons/response_model.dart';
import '../repositories/transaction_repository.dart';

class AddIncome {
  final TransactionRepository transactionRepository;

  AddIncome({required this.transactionRepository});

  Future<ResponseModel> execute(double amount, String remarks) async {
    return await transactionRepository.addIncome(amount, remarks);
  }
}
