import 'package:expense_tracker_pro/features/dashboard/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> userData) {
    return UserModel(
      id: userData['_id'],
      name: userData['name'],
      email: userData['email'],
      balance: (userData['balance'] as num).toDouble(),
    );
  }
}
