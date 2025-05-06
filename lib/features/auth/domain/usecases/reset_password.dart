import '../../data/models/user_auth_res.dart';
import '../repositories/user_auth_repository.dart';

class ResetPassword {
  final UserAuthRepository userAuthRepository;

  ResetPassword({required this.userAuthRepository});

  Future<UserAuthResModel> call(
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
