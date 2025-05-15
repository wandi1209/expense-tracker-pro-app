import '../../../../core/services/auth_service.dart';

import '../../../../common/buttons/basic_button.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, child: SvgPicture.asset(AppVectors.introBg)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(AppImages.introImage),
              const Text(
                "Spend Smarter\nSave more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                height: 104,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: BasicButton(
                  title: "Get Started",
                  onPressed: () async {
                    final token = await _authService.getToken();
                    if (token == null) {
                      context.go('/login');
                    } else {
                      context.go('/dashboard');
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have Account? "),
                    GestureDetector(
                      onTap: () async {
                        final token = await _authService.getToken();
                        if (token == null) {
                          context.go('/login');
                        } else {
                          context.go('/dashboard');
                        }
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
