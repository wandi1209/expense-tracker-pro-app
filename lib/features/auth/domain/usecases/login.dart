import 'package:dartz/dartz.dart';
import 'package:expense_tracker_pro/features/auth/domain/entities/user_auth.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class Login {
  final UserAuthRepository userAuthRepository;

  Login({required this.userAuthRepository});

  Future<Either<String, UserAuth>> call(String name, String email) async {
    return await userAuthRepository.login(name, email);
  }
}
