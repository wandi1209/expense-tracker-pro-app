import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';
import 'package:flutter/material.dart';

import '../datasources/remote_datasource.dart';
import '../models/forgot_password_req.dart';
import '../models/register_req.dart';
import '../models/reset_password_req.dart';
import '../models/auth_res_model.dart';
import '../../domain/repositories/user_auth_repository.dart';

class UserAuthRepositoryImplementation extends UserAuthRepository {
  final UserAuthRemoteDatasource remoteDatasource;

  UserAuthRepositoryImplementation({required this.remoteDatasource});
  @override
  Future<AuthResModel> forgotPassword(String email) async {
    try {
      final response = await remoteDatasource.forgotPassword(
        ForgotPasswordReqModel(email: email),
      );
      return response;
    } catch (e) {
      return AuthResModel(status: 'error', message: e.toString());
    }
  }

  @override
  Future<AuthResModel> login(String email, String password) async {
    try {
      final response = await remoteDatasource.login(
        LoginReqModel(email: email, password: password),
      );
      debugPrint('${response.accessToken}');
      return response;
    } catch (e) {
      return AuthResModel(status: 'error', message: e.toString());
    }
  }

  @override
  Future<AuthResModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await remoteDatasource.register(
        RegisterReqModel(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
      return response;
    } catch (e) {
      return AuthResModel(status: 'error', message: e.toString());
    }
  }

  @override
  Future<AuthResModel> resetPassword(
    String email,
    int resetCode,
    String newPassword,
  ) async {
    try {
      final response = await remoteDatasource.resetPassword(
        ResetPasswordReqModel(
          email: email,
          resetCode: resetCode,
          newPassword: newPassword,
        ),
      );
      return response;
    } catch (e) {
      return AuthResModel(status: 'error', message: e.toString());
    }
  }
}
