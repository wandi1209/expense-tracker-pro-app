import 'package:expense_tracker_pro/core/configs/assets/app_images.dart';
import 'package:expense_tracker_pro/core/configs/assets/app_vectors.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AppVectors.introBg),
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
                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    elevation: 5,
                    shadowColor: AppColors.secondary,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have Account? "),
                    Text("Log In", style: TextStyle(color: AppColors.primary)),
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
