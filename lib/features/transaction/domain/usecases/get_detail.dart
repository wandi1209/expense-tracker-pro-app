import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class GetDetail {
  final TransactionRepository transactionRepository;

  GetDetail({required this.transactionRepository});

  Future<TransactionModel> execute(String id) async {
    return await transactionRepository.getTransactionById(id);
  }
}
