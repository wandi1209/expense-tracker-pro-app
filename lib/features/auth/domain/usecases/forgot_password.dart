import '../../data/models/auth_res_model.dart';
import '../repositories/user_auth_repository.dart';

class ForgotPassword {
  final UserAuthRepository userAuthRepository;

  ForgotPassword({required this.userAuthRepository});

  Future<AuthResModel> call(String email) async {
    return await userAuthRepository.forgotPassword(email);
  }
}