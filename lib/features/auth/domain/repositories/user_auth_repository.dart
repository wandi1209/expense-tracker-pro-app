import '../../data/models/user_auth_res.dart';

abstract class UserAuthRepository {
  Future<UserAuthResModel> register(String name,String email,String password, String confirmPassword);
  Future<UserAuthResModel> login(String email,String password);
  Future<UserAuthResModel> forgotPassword(String email);
  Future<UserAuthResModel> resetPassword(String email, int resetCode, String newPassword);
}
