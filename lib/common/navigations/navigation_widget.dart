import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationWidget extends StatelessWidget {
  final Widget child;
  const NavigationWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.go('/dashboard');
              },
              icon: Icon(
                Icons.home,
                color:
                    location == '/dashboard'
                        ? AppColors.primary
                        : Colors.black54,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                context.push('/transactions');
              },
              icon: Icon(
                Icons.bar_chart,
                color:
                    location == '/transactions'
                        ? AppColors.primary
                        : Colors.black54,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                context.push('/transactions');
              },
              icon: Icon(
                Icons.wallet,
                color: location == '/' ? AppColors.primary : Colors.black54,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                context.push('/transactions');
              },
              icon: Icon(
                Icons.person,
                color: location == '/' ? AppColors.primary : Colors.black54,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
