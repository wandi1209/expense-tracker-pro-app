import 'package:expense_tracker_pro/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/buttons/basic_button.dart';
import '../../../../common/inputs/basic_input.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _login() {
    BlocProvider.of<AuthenticationBloc>(
      context,
    ).add(AuthEventLogin(email: email.text, password: password.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          } else if (state is AuthenticationSuccess) {
            context.push('/dashboard');
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return buildLoginForm();
          },
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login to your account.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Please sign in to your account",
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(height: 15),
              BasicInput(
                title: 'Email Address',
                hintText: 'john@gmail.com',
                controller: email,
              ),
              const SizedBox(height: 20),
              BasicInput(
                title: 'Password',
                hintText: '••••••••',
                obscure: true,
                controller: password,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/forgot-password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              BasicButton(title: 'Sign In', onPressed: _login),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account? "),
                  GestureDetector(
                    onTap: () {
                      context.go('/register');
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
