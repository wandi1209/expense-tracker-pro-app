import 'package:expense_tracker_pro/core/configs/assets/app_images.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/widgets/card_widget.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/widgets/history_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(AppImages.dashboardBg),
            Image.asset(AppImages.dashboardParticle),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Wandi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CardWidget(),
                    HistoryWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
