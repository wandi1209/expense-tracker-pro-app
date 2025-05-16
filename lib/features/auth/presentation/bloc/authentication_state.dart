part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  final String status;
  final String message;

  AuthenticationSuccess(this.status, this.message);

  @override
  List<Object?> get props => [status, message];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class AuthenticationSavedEmail extends AuthenticationState {
  final String email;

  AuthenticationSavedEmail(this.email);

  @override
  List<Object?> get props => [email];
}
