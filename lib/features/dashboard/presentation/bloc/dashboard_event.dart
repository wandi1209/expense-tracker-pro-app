part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {}

class DashboardEventGetDashboard extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardEventGetTotalAmount extends DashboardEvent {
  final String type;

  DashboardEventGetTotalAmount({required this.type});

  @override
  List<Object?> get props => [type];
}
