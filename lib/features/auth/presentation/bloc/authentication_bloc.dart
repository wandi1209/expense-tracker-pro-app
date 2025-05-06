import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_pro/features/auth/domain/entities/user_auth.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/forgot_password.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/login.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/register.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/reset_password.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Register register;
  final Login login;
  final ForgotPassword forgotPassword;
  final ResetPassword resetPassword;

  AuthenticationBloc({
    required this.register,
    required this.login,
    required this.forgotPassword,
    required this.resetPassword,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationEventRegister>((event, emit) async {
      final result = await register(
        event.name,
        event.email,
        event.password,
        event.confirmPassword,
      );
      result.fold(
        (failure) => emit(AuthenticationFailure(failure.message)),
        (user) => emit(AuthenticationAuthenticated(user)),
      );
    });
    on<AuthenticationEventLogin>((event, emit) async {
      final result = await login(event.email, event.password);
      result.fold(
        (failure) => emit(AuthenticationFailure(failure.message)),
        (user) => emit(AuthenticationAuthenticated(user)),
      );
    });
    on<AuthenticationEventForgotPassword>((event, emit) async {
      final result = await forgotPassword(event.email);
      result.fold(
        (failure) => emit(AuthenticationFailure(failure.message)),
        (message) => emit(AuthenticationSuccess(message)),
      );
    });
    on<AuthenticationEventResetPassword>((event, emit) async {
      final result = await resetPassword(
        event.email,
        event.resetCode,
        event.newPassword,
      );
      result.fold(
        (failure) => emit(AuthenticationFailure(failure.message)),
        (message) => emit(AuthenticationSuccess(message)),
      );
    });
  }
}
