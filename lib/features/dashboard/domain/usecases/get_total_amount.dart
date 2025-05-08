import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetTotalAmount {
  final DashboardRepository dashboardRepository;

  GetTotalAmount({required this.dashboardRepository});

  Future<double> call(String type) async {
    return await dashboardRepository.getTotalAmount(type);
  }
}
