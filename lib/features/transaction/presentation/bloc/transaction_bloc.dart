import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/add_expense.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/add_income.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/delete_transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/edit_transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/get_detail.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/get_transaction.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransaction getTransaction;
  final AddExpense addExpense;
  final AddIncome addIncome;
  final EditTransaction editTransaction;
  final DeleteTransaction deleteTransaction;
  final GetDetail getDetail;

  TransactionBloc({
    required this.getTransaction,
    required this.addExpense,
    required this.addIncome,
    required this.editTransaction,
    required this.deleteTransaction,
    required this.getDetail,
  }) : super(TransactionInitial()) {
    on<TransactionEventAddExpense>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await addExpense.execute(event.amount, event.remarks);
        if (result.status == 'success') {
          emit(AddTransactionSuccess(message: result.message));
        } else {
          emit(TransactionFailure(error: result.message));
        }
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
    on<TransactionEventAddIncome>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await addIncome.execute(event.amount, event.remarks);
        if (result.status == 'success') {
          emit(AddTransactionSuccess(message: result.message));
        } else {
          emit(TransactionFailure(error: result.message));
        }
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
    on<TransactionEventEdit>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await editTransaction.execute(
          event.id,
          event.amount,
          event.transactionType,
        );
        if (result.status == 'success') {
          emit(EditTransactionSucces(message: result.message));
        } else {
          emit(TransactionFailure(error: result.message));
        }
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
    on<TransactionEventDelete>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await deleteTransaction.execute(event.id);
        if (result.status == 'success') {
          emit(DeleteTransactionSuccess(message: result.message));
          add(TransactionEventGetTransactions());
        } else {
          emit(TransactionFailure(error: result.message));
        }
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
    on<TransactionEventGetTransactions>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await getTransaction.execute();

        emit(GetTransactionSuccess(transactions: result));
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
    on<TransactionEventGetDetail>((event, emit) async {
      try {
        emit(TransactionLoading());
        final result = await getDetail.execute(event.id);

        emit(GetDetailTransaction(transaction: result));
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
  }
}
