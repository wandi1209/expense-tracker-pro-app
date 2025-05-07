import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import '../models/forgot_password_req.dart';
import '../models/login_req.dart';
import '../models/register_req.dart';
import '../models/reset_password_req.dart';
import '../models/auth_res_model.dart';

abstract class UserAuthRemoteDatasource {
  Future<AuthResModel> register(RegisterReqModel dataRegister);
  Future<AuthResModel> login(LoginReqModel dataLogin);
  Future<AuthResModel> forgotPassword(ForgotPasswordReqModel dataForgot);
  Future<AuthResModel> resetPassword(ResetPasswordReqModel dataReset);
}

class UserAuthRemoteDatasourceImplementation extends UserAuthRemoteDatasource {
  final Dio dio;

  UserAuthRemoteDatasourceImplementation(this.dio);

  @override
  Future<AuthResModel> register(RegisterReqModel dataRegister) async {
    try {
      final response = await dio.post(
        '/users/register',
        data: dataRegister.toJson(),
      );
      return AuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      return AuthResModel.fromJson({
        'status': e.response?.data['status']?.toString(),
        'message': e.response?.data['message']?.toString(),
        'token': null,
      });
    }
  }

  @override
  Future<AuthResModel> login(LoginReqModel dataLogin) async {
    try {
      final response = await dio.post('/users/login', data: dataLogin.toJson());
      debugPrint(response.data['message']);
      return AuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      debugPrint(e.message);
      return AuthResModel.fromJson({
        'status': e.response?.data['status']?.toString(),
        'message': e.response?.data['message']?.toString(),
        'token': null,
      });
    }
  }

  @override
  Future<AuthResModel> forgotPassword(ForgotPasswordReqModel dataForgot) async {
    try {
      final response = await dio.post(
        '/users/forgot-password',
        data: dataForgot.toJson(),
      );

      return AuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
      });
    } on DioException catch (e) {
      return AuthResModel.fromJson({
        'status': e.response?.data['status'],
        'message': e.response?.data['message'],
      });
    }
  }

  @override
  Future<AuthResModel> resetPassword(ResetPasswordReqModel dataReset) async {
    try {
      final response = await dio.post(
        '/users/reset-password',
        data: dataReset.toJson(),
      );

      return AuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
      });
    } on DioException catch (e) {
      return AuthResModel.fromJson({
        'status': e.response?.data['status'],
        'message': e.response?.data['message'],
      });
    }
  }
}
