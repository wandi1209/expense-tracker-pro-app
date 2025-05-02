import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  const BasicButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          padding: EdgeInsets.symmetric(vertical: 18),
          elevation: 5,
          shadowColor: AppColors.secondary,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
