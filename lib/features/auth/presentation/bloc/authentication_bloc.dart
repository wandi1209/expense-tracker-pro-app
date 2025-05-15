import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/services/auth_service.dart';
import '../../domain/usecases/forgot_password.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/reset_password.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Register register;
  final ForgotPassword forgotPassword;
  final ResetPassword resetPassword;
  final authService = AuthService();

  AuthenticationBloc({
    required this.login,
    required this.register,
    required this.forgotPassword,
    required this.resetPassword,
  }) : super(AuthenticationInitial()) {
    on<AuthEventRegister>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final result = await register.call(
          event.name,
          event.email,
          event.password,
          event.confirmPassword,
        );
        if (result.status == 'success') {
          await authService.saveToken(result.accessToken);
          emit(AuthenticationSuccess(result.status, result.message));
        } else {
          emit(AuthenticationFailure(result.message));
        }
      } catch (e) {
        emit(AuthenticationFailure('Registration Failed'));
      }
    });

    on<AuthEventLogin>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final result = await login.call(event.email, event.password);
        if (result.status == 'success') {
          await authService.saveToken(result.accessToken);
          emit(AuthenticationSuccess(result.status, result.message));
        } else {
          emit(AuthenticationFailure(result.message));
        }
      } catch (e) {
        emit(AuthenticationFailure('Login Failed'));
      }
    });

    on<AuthEventForgotPassword>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final result = await forgotPassword.call(event.email);
        emit(AuthenticationSuccess(result.status, result.message));
      } catch (e) {
        emit(AuthenticationFailure('Forgot password request failed'));
      }
    });

    on<AuthEventResetPassword>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final result = await resetPassword.call(
          event.email,
          event.resetCode,
          event.newPassword,
        );
        emit(AuthenticationSuccess(result.status, result.message));
      } catch (e) {
        emit(AuthenticationFailure('Reset password failed'));
      }
    });
  }
}
