import 'package:dartz/dartz.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class ForgotPassword {
  final UserAuthRepository userAuthRepository;

  ForgotPassword({required this.userAuthRepository});

  Future<Either<String, void>> call(String email) async {
    return await userAuthRepository.forgotPassword(email);
  }
}
