import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';

class GetIncome {
  final DashboardRepository dashboardRepository;
  final List<Transaction> transactions;

  const GetIncome({
    required this.dashboardRepository,
    required this.transactions,
  });

  Future<double> execute() async {
    return await dashboardRepository.getIncome(transactions);
  }
}
