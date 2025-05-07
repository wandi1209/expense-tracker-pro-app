import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import '../models/forgot_password_req.dart';
import '../models/login_req.dart';
import '../models/register_req.dart';
import '../models/reset_password_req.dart';
import '../models/user_auth_res.dart';

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
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://192.168.21.150:3000/api',
          validateStatus: (status) {
            return status! < 500; // Menerima semua status di bawah 500
          },
        ),
      ).post('/users/register', data: dataRegister.toJson());
      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      print(e.message);
      return UserAuthResModel.fromJson({
        'status': e.response?.data['status']?.toString() ?? 'error',
        'message': e.response?.data['message']?.toString() ?? e.message,
        'token': null,
      });
    }
  }

  @override
  Future<UserAuthResModel> login(LoginReqModel dataLogin) async {
    try {
      final response = await dio.post('/users/login', data: dataLogin.toJson());
      debugPrint(response.data['message']);
      return UserAuthResModel.fromJson({
        'status': response.data['status'],
        'message': response.data['message'],
        'token': response.data['accessToken'],
      });
    } on DioException catch (e) {
      debugPrint(e.message);
      return UserAuthResModel.fromJson({
        'status': e.response?.data['status']?.toString() ?? 'error',
        'message': e.response?.data['message']?.toString() ?? e.message,
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
