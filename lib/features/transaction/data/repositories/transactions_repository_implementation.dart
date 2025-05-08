import 'package:expense_tracker_pro/core/respons/response_model.dart';
import 'package:expense_tracker_pro/features/transaction/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class TransactionsRepositoryImplementation extends TransactionRepository {
  final TransactioRemoteDatasource transactioRemoteDatasource;

  TransactionsRepositoryImplementation({
    required this.transactioRemoteDatasource,
  });

  @override
  Future<ResponseModel> addExpense(int amount, String remarks) async {
    try {
      final response = await transactioRemoteDatasource.addExpense(
        amount,
        remarks,
      );
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<ResponseModel> addIncome(int amount, String remarks) async {
    try {
      final response = await transactioRemoteDatasource.addIncome(
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
      final response = await transactioRemoteDatasource.deleteTransaction(id);
      return response;
    } catch (e) {
      return ResponseModel(status: 'failed', message: e.toString());
    }
  }

  @override
  Future<ResponseModel> editTransaction(
    String id,
    int amount,
    String transactionType,
  ) async {
    try {
      final response = await transactioRemoteDatasource.editTransaction(
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
          await transactioRemoteDatasource.getTransactions();
      return response;
    } catch (e) {
      return [];
    }
  }
}
