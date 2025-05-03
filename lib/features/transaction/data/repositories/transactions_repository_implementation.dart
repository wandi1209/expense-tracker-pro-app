import 'package:expense_tracker_pro/features/transaction/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';

class TransactionsRepositoryImplementation extends TransactionRepository {
  final TransactioRemoteDatasource transactioRemoteDatasource;

  TransactionsRepositoryImplementation({
    required this.transactioRemoteDatasource,
  });

  @override
  Future<Map<String, dynamic>> addExpense(int amount, String remarks) async {
    return await transactioRemoteDatasource.addExpense(amount, remarks);
  }

  @override
  Future<Map<String, dynamic>> addIncome(int amount, String remarks) async {
    return await transactioRemoteDatasource.addIncome(amount, remarks);
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(String id) async {
    return await transactioRemoteDatasource.deleteTransaction(id);
  }

  @override
  Future<Map<String, dynamic>> editTransaction(
    String id,
    int amount,
    String transactionType,
  ) async {
    return await transactioRemoteDatasource.editTransaction(
      id,
      amount,
      transactionType,
    );
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    List<Transaction> hasil =
        await transactioRemoteDatasource.getTransactions();
    return hasil;
  }
}
