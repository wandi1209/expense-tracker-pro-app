import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';

abstract class Dashboard {
  final DashboardRepository dashboardRepository;

  Dashboard({required this.dashboardRepository});

  Future<Map<String, dynamic>> execute() async {
    return await dashboardRepository.getDashboard();
  }
}
