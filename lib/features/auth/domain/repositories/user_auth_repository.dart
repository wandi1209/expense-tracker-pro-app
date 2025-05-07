import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';

import '../../data/models/user_auth_res.dart';

abstract class UserAuthRepository {
  Future<UserAuthResModel> register(String name,String email,String password, String confirmPassword);
  Future<UserAuthResModel> login(LoginReqModel req);
  Future<UserAuthResModel> forgotPassword(String email);
  Future<UserAuthResModel> resetPassword(String email, int resetCode, String newPassword);
}
