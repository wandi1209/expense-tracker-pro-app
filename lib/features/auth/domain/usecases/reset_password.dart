import 'package:expense_tracker_pro/features/auth/data/models/user_auth_res.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class ForgotPassword {
  final UserAuthRepository userAuthRepository;

  ForgotPassword({required this.userAuthRepository});

  Future<UserAuthResModel> call(String email, String resetCode, String newPassword) async {
    return await userAuthRepository.resetPassword(email, resetCode, newPassword);
  }
}