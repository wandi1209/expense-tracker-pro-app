import 'package:expense_tracker_pro/features/auth/data/datasources/remote_datasource.dart';
import 'package:expense_tracker_pro/features/auth/data/models/forgot_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/register_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/reset_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/user_auth_res.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class UserAuthRepositoryImplementation extends UserAuthRepository {
  final UserAuthRemoteDatasource remoteDatasource;

  UserAuthRepositoryImplementation({required this.remoteDatasource});
  @override
  Future<UserAuthResModel> forgotPassword(String email) async {
    UserAuthResModel hasil = await remoteDatasource.forgotPassword(
      {email: email} as ForgotPasswordReqModel,
    );
    return hasil;
  }

  @override
  Future<UserAuthResModel> login(String email, String password) async {
    UserAuthResModel hasil = await remoteDatasource.login(
      {email: email, password: password} as LoginReqModel,
    );
    return hasil;
  }

  @override
  Future<UserAuthResModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    UserAuthResModel hasil = await remoteDatasource.register(
      {
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          }
          as RegisterReqModel,
    );
    return hasil;
  }

  @override
  Future<UserAuthResModel> resetPassword(
    String email,
    String resetCode,
    String newPassword,
  ) async {
    UserAuthResModel hasil = await remoteDatasource.resetPassword(
      {email: email, resetCode: resetCode, newPassword: newPassword}
          as ResetPasswordReqModel,
    );
    return hasil;
  }
}
