part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class AuthenticationEventRegister extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  AuthenticationEventRegister({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [name, email, password, confirmPassword];
}

class AuthenticationEventLogin extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationEventLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthenticationEventForgotPassword extends AuthenticationEvent {
  final String email;

  AuthenticationEventForgotPassword({required this.email});

  @override
  List<Object?> get props => [email];
}

class AuthenticationEventResetPassword extends AuthenticationEvent {
  final String email;
  final int resetCode;
  final String newPassword;

  AuthenticationEventResetPassword({
    required this.email,
    required this.resetCode,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [email, resetCode, newPassword];
}
