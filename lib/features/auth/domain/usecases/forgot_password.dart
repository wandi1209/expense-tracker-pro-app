import '../../data/models/user_auth_res.dart';
import '../repositories/user_auth_repository.dart';

class ForgotPassword {
  final UserAuthRepository userAuthRepository;

  ForgotPassword({required this.userAuthRepository});

  Future<UserAuthResModel> call(String email) async {
    return await userAuthRepository.forgotPassword(email);
  }
}