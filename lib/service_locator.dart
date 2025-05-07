import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/features/auth/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/auth/data/repositories/user_auth_repository_implementation.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/forgot_password.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/login.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/register.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/reset_password.dart';
import 'package:expense_tracker_pro/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> init() async {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env["BASE_URL"]}',
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
}
