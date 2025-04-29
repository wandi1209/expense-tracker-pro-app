import 'package:dartz/dartz.dart';

import 'package:expense_tracker_pro/features/auth/domain/entities/user_auth.dart';

abstract class UserAuthRepository {
  Future<Either<String ,UserAuth>> register(String name,String email,String password, String confirmPassword);
  Future<Either<String ,UserAuth>> login(String email,String password);
  Future<Either<String ,void>> forgotPassword(String email);
  Future<Either<String ,void>> resetPassword(String email, String resetCode, String newPassword);
}
