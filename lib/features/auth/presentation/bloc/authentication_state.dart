part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
}
class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserAuth user;

  AuthenticationAuthenticated(this.user);
  
  @override
  List<Object?> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);
  
  @override
  List<Object?> get props => [error];
}
class AuthenticationSuccess extends AuthenticationState {
  final String message;

  AuthenticationSuccess(this.message);
  
  @override
  List<Object?> get props => [message];
}
