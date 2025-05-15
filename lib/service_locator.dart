import 'package:dio/dio.dart';
import 'core/services/auth_service.dart';
import 'features/auth/data/datasources/remote_datasource.dart';
import 'features/auth/data/repositories/user_auth_repository_implementation.dart';
import 'features/auth/domain/repositories/user_auth_repository.dart';
import 'features/auth/domain/usecases/forgot_password.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/domain/usecases/reset_password.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'features/dashboard/data/repositories/dashboard_repository_implementation.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/usecases/dashboard.dart';
import 'features/dashboard/domain/usecases/get_total_amount.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/statistic/data/repositories/statistic_repository_implementation.dart';
import 'features/statistic/domain/repositories/statistic_repository.dart';
import 'features/statistic/domain/usecases/get_transaction_by_filter.dart';
import 'features/statistic/domain/usecases/top_spending.dart';
import 'features/statistic/presentation/bloc/statistic_bloc.dart';
import 'features/transaction/data/datasources/remote_datasource.dart';
import 'features/transaction/data/repositories/transactions_repository_implementation.dart';
import 'features/transaction/domain/repositories/transaction_repository.dart';
import 'features/transaction/domain/usecases/add_expense.dart';
import 'features/transaction/domain/usecases/add_income.dart';
import 'features/transaction/domain/usecases/delete_transaction.dart';
import 'features/transaction/domain/usecases/edit_transaction.dart';
import 'features/transaction/domain/usecases/get_detail.dart';
import 'features/transaction/domain/usecases/get_transaction.dart';
import 'features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> init() async {
  final authService = AuthService();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env["BASE_URL"]}',
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await authService.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
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
      getDetail: locator(),
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
  locator.registerLazySingleton(
    () => GetDetail(transactionRepository: locator()),
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

  // FEATUTE - STATISTIC
  // BLOC
  locator.registerFactory(
    () => StatisticBloc(
      getTransactionByFilter: locator(),
      topTransactions: locator(),
    ),
  );
  // USECASE
  locator.registerLazySingleton(
    () => GetTransactionByFilter(statisticRepository: locator()),
  );
  locator.registerLazySingleton(
    () => TopSpending(statisticRepository: locator()),
  );
  // REPOSITORY
  locator.registerLazySingleton<StatisticRepository>(
    () => StatisticRepositoryImplementation(
      transactionRemoteDatasource: locator(),
    ),
  );
  // DATASOURCE
}
