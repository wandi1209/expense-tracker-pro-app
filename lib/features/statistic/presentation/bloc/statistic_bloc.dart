import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:expense_tracker_pro/features/statistic/domain/usecases/get_transaction_by_filter.dart';
import 'package:expense_tracker_pro/features/statistic/domain/usecases/top_spending.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final GetTransactionByFilter getTransactionByFilter;
  final TopSpending topTransactions;

  StatisticBloc({
    required this.getTransactionByFilter,
    required this.topTransactions,
  }) : super(StatisticInitial()) {
    on<StatisticEventGetTransactionsByFilter>((event, emit) async {
      try {
        emit(StatisticStateLoading());
        final result = await getTransactionByFilter.execute(
          event.dateFilter,
          event.type,
        );
        emit(StatisticGetByFilterSuccess(transactions: result));
      } catch (e) {
        emit(StatisticStateFailure(error: e.toString()));
      }
    });
  }
}
