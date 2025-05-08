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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> init() async {
  final authService = AuthService();
  String? token = await authService.getToken();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env["BASE_URL"]}',
      headers: {'Authorization': token != null ? 'Bearer $token' : ''},
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
  // USECASE
  // REPOSITORY
  // USECASE
  // DATASOURCE
  locator.registerLazySingleton<TransactioRemoteDatasource>(
    () => TransactioRemoteDatasourceImplementation(dio),
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
      transactioRemoteDatasource: locator(),
    ),
  );
  // DATASOURCE
  locator.registerLazySingleton<DashboardRemoteDatasource>(
    () => DashboardRemoteDatasourceImplementation(dio: dio),
  );
}
