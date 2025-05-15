import '../../../../core/respons/response_model.dart';
import '../datasources/remote_datasource.dart';
import '../models/transaction_model.dart';
import '../../domain/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';

class TransactionsRepositoryImplementation extends TransactionRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;

  TransactionsRepositoryImplementation({
    required this.transactionRemoteDatasource,
  });

  @override
  Future<ResponseModel> addExpense(double amount, String remarks) async {
    try {
      final response = await transactionRemoteDatasource.addExpense(
        amount,
        remarks,
      );
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<ResponseModel> addIncome(double amount, String remarks) async {
    try {
      final response = await transactionRemoteDatasource.addIncome(
        amount,
        remarks,
      );
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<ResponseModel> deleteTransaction(String id) async {
    try {
      final response = await transactionRemoteDatasource.deleteTransaction(id);
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<ResponseModel> editTransaction(
    String id,
    double amount,
    String transactionType,
  ) async {
    try {
      final response = await transactionRemoteDatasource.editTransaction(
        id,
        amount,
        transactionType,
      );
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      List<TransactionModel> response =
          await transactionRemoteDatasource.getTransactions();

      return response;
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    try {
      List<TransactionModel> listTransaction = await getTransactions();
      for (var e in listTransaction) {
        if (e.id == id) {
          return e;
        }
      }
      throw Exception('Transaction with id $id not found');
    } catch (e) {
      throw Exception('Failed get transaction with id: $e');
    }
  }
}
