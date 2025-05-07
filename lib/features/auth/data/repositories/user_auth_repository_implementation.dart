import '../datasources/remote_datasource.dart';
import '../models/forgot_password_req.dart';
import '../models/login_req.dart';
import '../models/register_req.dart';
import '../models/reset_password_req.dart';
import '../models/user_auth_res.dart';
import '../../domain/repositories/user_auth_repository.dart';

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
  Future<UserAuthResModel> login(LoginReqModel req) async {
    UserAuthResModel hasil = await remoteDatasource.login(req);
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
    int resetCode,
    String newPassword,
  ) async {
    UserAuthResModel hasil = await remoteDatasource.resetPassword(
      {email: email, resetCode: resetCode, newPassword: newPassword}
          as ResetPasswordReqModel,
    );
    return hasil;
  }
}
