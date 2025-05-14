import 'package:expense_tracker_pro/core/respons/response_model.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

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
