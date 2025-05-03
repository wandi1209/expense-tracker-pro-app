import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

abstract class TransactioRemoteDatasource {
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

class TransactioRemoteDatasourceImplementation
    extends TransactioRemoteDatasource {
  final Dio dio;

  TransactioRemoteDatasourceImplementation(this.dio);

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
  Future<Map<String, dynamic>> editTransaction(
    String id,
    int amount,
    String transactionType,
  ) {
    // TODO: implement editTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    var response = await dio.get('/transactions/');
    final List data = response.data;
    return TransactionModel.fromJsonList(data);
  }
}
