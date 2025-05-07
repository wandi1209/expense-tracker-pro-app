import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/forgot_password.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/login.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/register.dart';
import 'package:expense_tracker_pro/features/auth/domain/usecases/reset_password.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Register register;
  final ForgotPassword forgotPassword;
  final ResetPassword resetPassword;
  final _storage = const FlutterSecureStorage();

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
          await _storage.write(key: 'token', value: result.accessToken);
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
          await _storage.write(key: 'token', value: result.accessToken);
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
