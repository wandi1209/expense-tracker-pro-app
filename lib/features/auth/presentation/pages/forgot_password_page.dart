import '../../../../common/buttons/basic_button.dart';
import '../../../../common/inputs/basic_input.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Enter your email address and we’ll send you confirmation code to reset your password',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),
                BasicInput(
                  title: 'Email Address',
                  hintText: 'john@gmail.com',
                  controller: email,
                ),
                const SizedBox(height: 40),
                BasicButton(title: 'Continue', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
