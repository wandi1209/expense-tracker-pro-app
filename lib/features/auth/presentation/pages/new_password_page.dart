import '../../../../common/buttons/basic_button.dart';
import '../../../../common/inputs/basic_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController email = TextEditingController();
    // TextEditingController resetCode = TextEditingController();
    TextEditingController newPassword = TextEditingController();

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
                BasicInput(
                  title: 'New Password',
                  hintText: '••••••••',
                  obscure: true,
                  controller: newPassword,
                ),
                const SizedBox(height: 40),
                BasicButton(
                  title: 'Submit',
                  onPressed: () {
                    context.go('/dashboard');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
