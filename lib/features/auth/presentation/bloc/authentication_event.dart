part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class AuthEventRegister extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  AuthEventRegister({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props => [name, email, password, confirmPassword];
}

class AuthEventLogin extends AuthenticationEvent {
  final String email;
  final String password;

  AuthEventLogin({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class AuthEventForgotPassword extends AuthenticationEvent {
  final String email;

  AuthEventForgotPassword({required this.email});
  @override
  List<Object?> get props => [email];
}

class AuthEventResetPassword extends AuthenticationEvent {
  final int resetCode;
  final String newPassword;

  AuthEventResetPassword({required this.resetCode, required this.newPassword});

  @override
  List<Object?> get props => [resetCode, newPassword];
}
