import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/features/auth/data/models/forgot_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/register_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/reset_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/user_auth_res.dart';

abstract class UserAuthRemoteDatasource {
  Future<UserAuthResModel> register(RegisterReqModel dataRegister);
  Future<UserAuthResModel> login(LoginReqModel dataLogin);
  Future<UserAuthResModel> forgotPassword(ForgotPasswordReqModel dataForgot);
  Future<UserAuthResModel> resetPassword(ResetPasswordReqModel dataReset);
}

class UserAuthRemoteDatasourceImplementation extends UserAuthRemoteDatasource {
  final Dio dio;

  UserAuthRemoteDatasourceImplementation(this.dio);

  @override
  Future<UserAuthResModel> register(RegisterReqModel dataRegister) async {
    try {
      final response = await dio.post(
        '/users/register',
        data: dataRegister.toJson(),
      );
      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      return UserAuthResModel.fromJson({
         'status': e.response?.data['status'],
        'message': e.response?.data['message'] ?? 'Register failed',
        'token': null,
      });
    }
  }

  @override
  Future<UserAuthResModel> login(LoginReqModel dataLogin) async {
    try {
      final response = await dio.post('/users/login', data: dataLogin.toJson());
      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      return UserAuthResModel.fromJson({
         'status': e.response?.data['status'],
        'message': e.response?.data['message'] ?? 'Login failed',
        'token': null,
      });
    }
  }

  @override
  Future<UserAuthResModel> forgotPassword(
    ForgotPasswordReqModel dataForgot,
  ) async {
    try {
      final response = await dio.post(
        '/users/forgot-password',
        data: dataForgot.toJson(),
      );

      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
      });
    } on DioException catch (e) {
      return UserAuthResModel.fromJson({
        'status': e.response?.data['status'],
        'message': e.response?.data['message'],
      });
    }
  }

  @override
  Future<UserAuthResModel> resetPassword(
    ResetPasswordReqModel dataReset,
  ) async {
    try {
      final response = await dio.post(
        '/users/reset-password',
        data: dataReset.toJson(),
      );

      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
      });
    } on DioException catch (e) {
      return UserAuthResModel.fromJson({
        'status': e.response?.data['status'],
        'message': e.response?.data['message'],
      });
    }
  }
}
