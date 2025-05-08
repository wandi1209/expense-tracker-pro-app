import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/core/respons/response_model.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

abstract class TransactionRemoteDatasource {
  Future<List<TransactionModel>> getTransactions();
  Future<ResponseModel> addIncome(int amount, String remarks);
  Future<ResponseModel> addExpense(int amount, String remarks);
  Future<ResponseModel> editTransaction(
    String id,
    int amount,
    String transactionType,
  );
  Future<ResponseModel> deleteTransaction(String id);
}

class TransactionRemoteDatasourceImplementation
    extends TransactionRemoteDatasource {
  final Dio dio;

  TransactionRemoteDatasourceImplementation(this.dio);

  @override
  Future<ResponseModel> addExpense(int amount, String remarks) async {
    Map<String, dynamic> data = {'amount': amount, 'remarks': remarks};
    var response = await dio.post('/transactions/addIncome', data: data);
    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<ResponseModel> addIncome(int amount, String remarks) async {
    Map<String, dynamic> data = {'amount': amount, 'remarks': remarks};
    var response = await dio.post('/transactions/addExpense', data: data);
    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<ResponseModel> deleteTransaction(String id) async {
    var response = await dio.delete('.transactions/$id');
    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<ResponseModel> editTransaction(
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
    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    var response = await dio.get('/transactions');
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = response.data['data'];
      return TransactionModel.fromJsonList(data);
    }
    debugPrint('${response.statusCode}');
    throw Exception('Failed to load transactions');
  }
}
