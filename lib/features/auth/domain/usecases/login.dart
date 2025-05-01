import '../../data/models/user_auth_res.dart';
import '../repositories/user_auth_repository.dart';

class Login {
  final UserAuthRepository userAuthRepository;

  Login({required this.userAuthRepository});

  Future<UserAuthResModel> call(String name, String email) async {
    return await userAuthRepository.login(name, email);
  }
}
