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
  Future<Map<String, dynamic>> addExpense(int amount, String remarks) async {
    Map<String, dynamic> data = {'amount': amount, 'remarks': remarks};
    var response = await dio.post('/transactions/addIncome', data: data);
    return {
      'status': response.data['status'],
      'message': response.data['message'],
    };
  }

  @override
  Future<Map<String, dynamic>> addIncome(int amount, String remarks) async {
    Map<String, dynamic> data = {'amount': amount, 'remarks': remarks};
    var response = await dio.post('/transactions/addExpense', data: data);
    return {
      'status': response.data['status'],
      'message': response.data['message'],
    };
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(String id) async {
    var response = await dio.delete('.transactions/$id');
    return {
      'status': response.data['status'],
      'message': response.data['message'],
    };
  }

  @override
  Future<Map<String, dynamic>> editTransaction(
    String id,
    int amount,
    String transactionType,
  ) async {
    Map<String, dynamic> data = {
      'transaction_id': id,
      'amount': amount,
      'transaction_field': transactionType,
    };

    var response = await dio.patch('/transactions', data: data);
    return {
      'status': response.data['status'],
      'message': response.data['message'],
    };
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    var response = await dio.get('/transactions');
    final List data = response.data;
    return TransactionModel.fromJsonList(data);
  }
}
