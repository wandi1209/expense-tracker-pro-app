
import '../../data/models/auth_res_model.dart';

abstract class UserAuthRepository {
  Future<AuthResModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
  Future<AuthResModel> login(String email, String password);
  Future<AuthResModel> forgotPassword(String email);
  Future<AuthResModel> resetPassword(
    String email,
    int resetCode,
    String newPassword,
  );
}
