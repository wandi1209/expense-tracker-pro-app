import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

abstract class DashboardRepository {
  Future<Map<String, dynamic>> getDashboard();
  Future<double> getExpense(List<Transaction> transactions);
  Future<double> getIncome(List<Transaction> transactions);
}
