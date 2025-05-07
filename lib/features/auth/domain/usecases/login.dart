import '../../data/models/auth_res_model.dart';
import '../repositories/user_auth_repository.dart';

class Login {
  final UserAuthRepository userAuthRepository;

  Login({required this.userAuthRepository});

  Future<AuthResModel> call(String email, String password) async {
    return await userAuthRepository.login(email, password);
  }
}
