import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_pro/features/dashboard/data/models/dashboard_model.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/usecases/dashboard.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/usecases/get_total_amount.dart';
import 'package:flutter/rendering.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Dashboard getDashboard;
  final GetTotalAmount getTotalAmount;

  DashboardBloc({required this.getDashboard, required this.getTotalAmount})
    : super(DashboardInitial()) {
    on<DashboardEventGetDashboard>((event, emit) async {
      try {
        emit(DashboardStateLoading());
        final result = await getDashboard.call();
        if (result.status == 'success') {
          emit(DashboardStateGetDashboardSuccess(data: result));
        } else {
          emit(DashboardStateFailure(error: 'Data getting failed'));
        }
      } catch (e) {
        emit(DashboardStateFailure(error: e.toString()));
      }
    });
    on<DashboardEventGetTotalAmount>((event, emit) async {
      try {
        emit(DashboardStateLoading());
        final result = await getTotalAmount.call(event.type);
        emit(DashboardStateGetAmountSuccess(amount: result));
      } catch (e) {
        debugPrint(e.toString());
        emit(DashboardStateFailure(error: 'Data getting failed'));
      }
    });
  }
}
