import 'package:expense_tracker_pro/features/auth/data/models/user_auth_res.dart';
import 'package:expense_tracker_pro/features/auth/domain/repositories/user_auth_repository.dart';

class Register {
  final UserAuthRepository userAuthRepository;

  Register({required this.userAuthRepository});

  Future<UserAuthResModel> call(
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
