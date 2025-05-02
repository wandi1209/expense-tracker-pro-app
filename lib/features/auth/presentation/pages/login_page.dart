import 'package:expense_tracker_pro/common/buttons/basic_button.dart';
import 'package:expense_tracker_pro/common/inputs/basic_input.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login to your account.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Please sign in to your account",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                SizedBox(height: 15),
                BasicInput(title: 'Email Address', hintText: 'john@gmail.com'),
                SizedBox(height: 20),
                BasicInput(
                  title: 'Password',
                  hintText: '••••••••',
                  obscure: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                BasicButton(title: 'Sign In', onPressed: () {}),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account? "),
                    Text(
                      "Register",
                      style: TextStyle(color: AppColors.primary),
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
