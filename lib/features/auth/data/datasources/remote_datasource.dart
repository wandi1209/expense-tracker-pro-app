import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/features/auth/data/models/forgot_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/register_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/reset_password_req.dart';
import 'package:expense_tracker_pro/features/auth/data/models/user_auth_res.dart';

abstract class RemoteDatasource {
  Future<UserAuthResModel> register(RegisterReqModel dataRegister);
  Future<UserAuthResModel> login(LoginReqModel dataLogin);
  Future<UserAuthResModel> forgotPassword(ForgotPasswordReqModel dataForgot);
  Future<UserAuthResModel> resetPassword(ResetPasswordReqModel dataReset);
}

class RemoteDatasourceImplementation extends RemoteDatasource {
  final Dio dio;

  RemoteDatasourceImplementation(this.dio);

  @override
  Future<UserAuthResModel> register(RegisterReqModel dataRegister) async {
    var response = await dio.post(
      '/users/register',
      data: dataRegister.toJson(),
    );
    return UserAuthResModel.fromJson({
      'status': response.data['status'],
      'message': response.data['message'],
      'token': response.data['token'],
    });
  }

  @override
  Future<UserAuthResModel> login(LoginReqModel dataLogin) async {
    var response = await dio.post('/users/login', data: dataLogin.toJson());

    return UserAuthResModel.fromJson({
      'status': response.data['status'],
      'message': response.data['message'],
      'token': response.data['token'],
    });
  }

  @override
  Future<UserAuthResModel> forgotPassword(ForgotPasswordReqModel dataForgot) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserAuthResModel> resetPassword(ResetPasswordReqModel dataReset) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
