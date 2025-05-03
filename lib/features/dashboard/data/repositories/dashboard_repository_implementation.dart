import 'package:expense_tracker_pro/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImplementation extends DashboardRepository {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRepositoryImplementation({required this.dashboardRemoteDatasource});
  @override
  Future<Map<String, dynamic>> getDashboard() async {
    return await dashboardRemoteDatasource.dashboard();
  }
}
