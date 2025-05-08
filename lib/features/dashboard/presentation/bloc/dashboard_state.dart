part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {}

class DashboardInitial extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardStateLoading extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardStateGetDashboardSuccess extends DashboardState {
  final DashboardModel data;
  final double expense;
  final double income;

  DashboardStateGetDashboardSuccess({
    required this.data,
    required this.expense,
    required this.income,
  });
  @override
  List<Object?> get props => [data];
}

class DashboardStateGetAmountSuccess extends DashboardState {
  final double amount;

  DashboardStateGetAmountSuccess({required this.amount});
  @override
  List<Object?> get props => [amount];
}

class DashboardStateFailure extends DashboardState {
  final String error;

  DashboardStateFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
