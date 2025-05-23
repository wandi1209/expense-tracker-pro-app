import '../datasources/dashboard_remote_datasource.dart';
import '../models/dashboard_model.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../../transaction/data/datasources/remote_datasource.dart';

class DashboardRepositoryImplementation extends DashboardRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRepositoryImplementation({
    required this.dashboardRemoteDatasource,
    required this.transactionRemoteDatasource,
  });
  @override
  Future<DashboardModel> getDashboard() async {
    return await dashboardRemoteDatasource.dashboard();
  }

  @override
  Future<double> getTotalAmount(String type) async {
    final allTransactions = await transactionRemoteDatasource.getTransactions();
    double total = 0;
    for (var transaction in allTransactions) {
      if (type == transaction.transactionType) {
        total += transaction.amount;
      }
    }
    return total;
  }
}
