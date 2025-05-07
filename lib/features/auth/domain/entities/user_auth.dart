import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String id;
  final String name;
  final String email;
  final String accessToken;

  const UserAuth({
    required this.id,
    required this.name,
    required this.email,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [id, name, email, accessToken];
}
