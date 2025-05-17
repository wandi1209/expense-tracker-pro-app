import 'package:expense_tracker_pro/core/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkFirst();
  }

  Future<void> _checkFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isFirstTime = prefs.getBool('is_first_time');

    Future.delayed(const Duration(seconds: 3), () async {
      if (isFirstTime == null) {
        prefs.setBool('is_first_time', true);
        context.go('/intro');
      } else {
        final token = await authService.getToken();
        if (token == null) {
          context.go('/login');
        } else {
          context.go('/dashboard');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SvgPicture.asset(AppVectors.splashParticle),
          const Center(
            child: Text(
              'mono',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                letterSpacing: -4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
