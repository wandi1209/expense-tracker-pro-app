import 'package:expense_tracker_pro/features/dashboard/data/models/dashboard_model.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';

class Dashboard {
  final DashboardRepository dashboardRepository;

  Dashboard({required this.dashboardRepository});

  Future<DashboardModel> call() async {
    return await dashboardRepository.getDashboard();
  }
}
