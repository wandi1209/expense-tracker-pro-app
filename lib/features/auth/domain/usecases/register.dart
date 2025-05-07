import '../../data/models/auth_res_model.dart';
import '../repositories/user_auth_repository.dart';

class Register {
  final UserAuthRepository userAuthRepository;

  Register({required this.userAuthRepository});

  Future<AuthResModel> call(
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
