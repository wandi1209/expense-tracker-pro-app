import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/dashboard_model.dart';
import '../../domain/usecases/dashboard.dart';
import '../../domain/usecases/get_total_amount.dart';
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
        final income = await getTotalAmount.call('income');
        final expense = await getTotalAmount.call('expense');

        if (result.status == 'success') {
          emit(
            DashboardStateGetDashboardSuccess(
              data: result,
              expense: expense,
              income: income,
            ),
          );
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
