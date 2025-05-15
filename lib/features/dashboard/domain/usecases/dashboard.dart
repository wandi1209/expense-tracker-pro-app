import '../../data/models/dashboard_model.dart';
import '../repositories/dashboard_repository.dart';

class Dashboard {
  final DashboardRepository dashboardRepository;

  Dashboard({required this.dashboardRepository});

  Future<DashboardModel> call() async {
    return await dashboardRepository.getDashboard();
  }
}
