import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String id;
  final String name;
  final String email;
  final String accesToken;

  const UserAuth({required this.id, required this.name, required this.email, required this.accesToken});


  @override
  List<Object?> get props => [id, name, email, accesToken];
}
