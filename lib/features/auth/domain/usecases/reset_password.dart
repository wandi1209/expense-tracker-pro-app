import 'package:dartz/dartz.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class ForgotPassword {
  final UserAuthRepository userAuthRepository;

  ForgotPassword({required this.userAuthRepository});

  Future<Either<String, void>> call(String email, String resetCode, String newPassword) async {
    return await userAuthRepository.resetPassword(email, resetCode, newPassword);
  }
}