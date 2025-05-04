abstract class DashboardRepository {
  Future<Map<String, dynamic>> getDashboard();
  Future<double> getTotalAmount(String type);
}
