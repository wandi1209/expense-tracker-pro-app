import 'package:dartz/dartz.dart';
import 'package:expense_tracker_pro/features/auth/domain/entities/user_auth.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class Register {
  final UserAuthRepository userAuthRepository;

  Register({required this.userAuthRepository});

  Future<Either<String, UserAuth>> call(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await userAuthRepository.register(
      name,
      email,
      password,
      confirmPassword,
    );
  }
}
