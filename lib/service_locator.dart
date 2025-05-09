import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/core/services/auth_service.dart';
import 'package:expense_tracker_pro/features/auth/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/auth/data/repositories/user_auth_repository_implementation.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/forgot_password.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/login.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/register.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/reset_password.dart';
import 'package:expense_tracker_pro/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:expense_tracker_pro/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:expense_tracker_pro/features/dashboard/data/repositories/dashboard_repository_implementation.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/usecases/dashboard.dart';
import 'package:expense_tracker_pro/features/dashboard/domain/usecases/get_total_amount.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:expense_tracker_pro/features/transaction/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/transaction/data/repositories/transactions_repository_implementation.dart';
import 'package:expense_tracker_pro/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/add_expense.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/add_income.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/delete_transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/edit_transaction.dart';
import 'package:expense_tracker_pro/features/transaction/domain/usecases/get_transaction.dart';
import 'package:expense_tracker_pro/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> init() async {
  final authService = AuthService();
  String? token = await authService.getToken();
  debugPrint("token nih : ${token}");

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env["BASE_URL"]}',
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
      validateStatus: (status) {
        return status! < 500; // Menerima semua status di bawah 500
      },
    ),
  );
  locator.registerLazySingleton(() => dio);

  // Feature - Auth
  // BLOC
  locator.registerFactory(
    () => AuthenticationBloc(
      register: locator(),
      login: locator(),
      forgotPassword: locator(),
      resetPassword: locator(),
    ),
  );

  // USECASE
  locator.registerLazySingleton(() => Register(userAuthRepository: locator()));
  locator.registerLazySingleton(() => Login(userAuthRepository: locator()));
  locator.registerLazySingleton(
    () => ForgotPassword(userAuthRepository: locator()),
  );
  locator.registerLazySingleton(
    () => ResetPassword(userAuthRepository: locator()),
  );

  // REPOSITORY
  locator.registerLazySingleton<UserAuthRepository>(
    () => UserAuthRepositoryImplementation(remoteDatasource: locator()),
  );

  // DATASOURCE
  locator.registerLazySingleton<UserAuthRemoteDatasource>(
    () => UserAuthRemoteDatasourceImplementation(dio),
  );

  // Feature - TRANSACTION
  // BLOC
  locator.registerFactory(
    () => TransactionBloc(
      getTransaction: locator(),
      addExpense: locator(),
      addIncome: locator(),
      editTransaction: locator(),
      deleteTransaction: locator(),
    ),
  );
  // USECASE
  locator.registerLazySingleton(
    () => GetTransaction(transactionRepository: locator()),
  );
  locator.registerLazySingleton(
    () => AddExpense(transactionRepository: locator()),
  );
  locator.registerLazySingleton(
    () => AddIncome(transactionRepository: locator()),
  );
  locator.registerLazySingleton(
    () => EditTransaction(transactionRepository: locator()),
  );
  locator.registerLazySingleton(
    () => DeleteTransaction(transactionRepository: locator()),
  );
  // REPOSITORY
  locator.registerLazySingleton<TransactionRepository>(
    () => TransactionsRepositoryImplementation(
      transactionRemoteDatasource: locator(),
    ),
  );
  // DATASOURCE
  locator.registerLazySingleton<TransactionRemoteDatasource>(
    () => TransactionRemoteDatasourceImplementation(dio),
  );

  // Feature - DASHBOARD
  // BLOC
  locator.registerFactory(
    () => DashboardBloc(getDashboard: locator(), getTotalAmount: locator()),
  );
  // USECASE
  locator.registerLazySingleton(
    () => Dashboard(dashboardRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTotalAmount(dashboardRepository: locator()),
  );
  // REPOSITORY
  locator.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImplementation(
      dashboardRemoteDatasource: locator(),
      transactionRemoteDatasource: locator(),
    ),
  );
  // DATASOURCE
  locator.registerLazySingleton<DashboardRemoteDatasource>(
    () => DashboardRemoteDatasourceImplementation(dio: dio),
  );
}
