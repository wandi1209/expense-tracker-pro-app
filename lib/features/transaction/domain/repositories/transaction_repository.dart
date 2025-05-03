import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
  Future<Map<String, dynamic>> addIncome(int amount, String remarks);
  Future<Map<String, dynamic>> addExpense(int amount, String remarks);
  Future<Map<String, dynamic>> editTransaction(
    String id,
    int amount,
    String transactionType,
  );
  Future<Map<String, dynamic>> deleteTransaction(String id);
}
