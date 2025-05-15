import '../../data/models/dashboard_model.dart';

abstract class DashboardRepository {
  Future<DashboardModel> getDashboard();
  Future<double> getTotalAmount(String type);
}
