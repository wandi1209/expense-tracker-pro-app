import '../../../../core/respons/response_model.dart';
import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<TransactionModel>> getTransactions();
  Future<TransactionModel> getTransactionById(String id);
  Future<ResponseModel> addIncome(double amount, String remarks);
  Future<ResponseModel> addExpense(double amount, String remarks);
  Future<ResponseModel> editTransaction(
    String id,
    double amount,
    String transactionType,
  );
  Future<ResponseModel> deleteTransaction(String id);
}
