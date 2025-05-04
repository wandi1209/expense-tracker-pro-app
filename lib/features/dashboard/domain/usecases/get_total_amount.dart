import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetTotalAmount {
  final DashboardRepository dashboardRepository;
  final String type;

  GetTotalAmount({required this.dashboardRepository, required this.type});

  Future<double> execute() async {
    return await dashboardRepository.getTotalAmount(type);
  }
}
