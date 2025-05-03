import 'package:expense_tracker_pro/common/buttons/basic_button.dart';
import 'package:expense_tracker_pro/common/inputs/basic_input.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Your new password must be different from the previously used password',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),
                const BasicInput(
                  title: 'New Password',
                  hintText: '••••••••',
                  obscure: true,
                ),
                const SizedBox(height: 40),
                BasicButton(title: 'Submit', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
