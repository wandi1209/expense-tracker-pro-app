import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enum.dart';
import '../../domain/usecases/get_transaction_by_filter.dart';
import '../../domain/usecases/top_spending.dart';
import '../../../transaction/data/models/transaction_model.dart';

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
    on<StatisticEventGetTopTransactions>((event, emit) async {
      try {
        emit(StatisticStateLoading());
        final result = await topTransactions.execute(event.top, event.type);
        emit(StatisticGetTopTransactionsSuccess(topTransactions: result));
      } catch (e) {
        emit(StatisticStateFailure(error: e.toString()));
      }
    });
  }
}
