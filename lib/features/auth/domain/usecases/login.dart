import 'package:expense_tracker_pro/features/auth/data/models/login_req.dart';

import '../../data/models/user_auth_res.dart';
import '../repositories/user_auth_repository.dart';

class Login {
  final UserAuthRepository userAuthRepository;

  Login({required this.userAuthRepository});

  Future<UserAuthResModel> call(LoginReqModel req) async {
    return await userAuthRepository.login(req);
  }
}
