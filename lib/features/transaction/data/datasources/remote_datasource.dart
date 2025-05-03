import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

abstract class TransactioRemoteDatasource {
  Future<Transaction> getTransactions();
  Future<Map<String, dynamic>> addIncome(int amount, String remarks);
  Future<Map<String, dynamic>> addExpense(int amount, String remarks);
  Future<Map<String, dynamic>> editTransaction(
    String id,
    int amount,
    String transactionType,
  );
  Future<Map<String, dynamic>> deleteTransaction(String id);
}

class TransactioRemoteDatasourceImplementation extends TransactioRemoteDatasource {
  @override
  Future<Map<String, dynamic>> addExpense(int amount, String remarks) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> addIncome(int amount, String remarks) {
    // TODO: implement addIncome
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(String id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> editTransaction(String id, int amount, String transactionType) {
    // TODO: implement editTransaction
    throw UnimplementedError();
  }

  @override
  Future<Transaction> getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

}
