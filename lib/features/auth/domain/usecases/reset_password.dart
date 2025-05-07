import '../../data/models/auth_res_model.dart';
import '../repositories/user_auth_repository.dart';

class ResetPassword {
  final UserAuthRepository userAuthRepository;

  ResetPassword({required this.userAuthRepository});

  Future<AuthResModel> call(
    String email,
    int resetCode,
    String newPassword,
  ) async {
    return await userAuthRepository.resetPassword(
      email,
      resetCode,
      newPassword,
    );
  }
}
