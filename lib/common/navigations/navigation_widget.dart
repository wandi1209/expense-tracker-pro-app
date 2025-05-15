import '../sheet/sheet_add_widget.dart';
import '../../core/configs/theme/app_colors.dart';
import '../../features/transaction/presentation/bloc/transaction_bloc.dart';
import '../../service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationWidget extends StatelessWidget {
  final Widget child;
  const NavigationWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return Scaffold(
      body: child,
      floatingActionButton:
          location == '/dashboard'
              ? FloatingActionButton(
                shape: const CircleBorder(),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => locator<TransactionBloc>(),
                        child: const SheetAddWidget(),
                      );
                    },
                  );
                },
                child: const Icon(Icons.add, size: 30),
              )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.push('/dashboard');
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
                context.push('/statistic');
              },
              icon: Icon(
                Icons.bar_chart,
                color:
                    location == '/statistic'
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
                color:
                    location == '/transactions'
                        ? AppColors.primary
                        : Colors.black54,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                context.push('/profile');
              },
              icon: Icon(
                Icons.person,
                color:
                    location == '/profile' ? AppColors.primary : Colors.black54,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
