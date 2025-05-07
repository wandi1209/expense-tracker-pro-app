import 'package:go_router/go_router.dart';

import '../../../../common/buttons/basic_button.dart';
import '../../../../common/inputs/basic_input.dart';
import '../../../../core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create your new account.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Create an account to start looking for the food you like",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 15),
                BasicInput(title: 'Name', hintText: 'John Doe', controller: name,),
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
                const SizedBox(height: 20),
                BasicInput(
                  title: 'Confirm Password',
                  hintText: '••••••••',
                  obscure: true,
                  controller: confirmPassword,
                ),
                const SizedBox(height: 30),
                BasicButton(title: 'Register', onPressed: () {}),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account? "),
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
