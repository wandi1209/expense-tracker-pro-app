import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final double balance;

  const User({required this.id, required this.name, required this.email, required this.balance});


  @override
  List<Object?> get props => [id, name, email, balance];
}
