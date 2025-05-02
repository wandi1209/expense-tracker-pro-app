import 'package:expense_tracker_pro/common/buttons/basic_button.dart';
import 'package:expense_tracker_pro/core/configs/assets/app_images.dart';
import 'package:expense_tracker_pro/core/configs/assets/app_vectors.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
              Text(
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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: BasicButton(
                  title: "Get Started",
                  onPressed: () {
                    context.go('/login');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have Account? "),
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: Text(
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
