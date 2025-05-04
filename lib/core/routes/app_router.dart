import 'package:expense_tracker_pro/common/navigations/navigation_widget.dart';
import 'package:expense_tracker_pro/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:expense_tracker_pro/features/auth/presentation/pages/new_password_page.dart';
import 'package:expense_tracker_pro/features/auth/presentation/pages/register_page.dart';
import 'package:expense_tracker_pro/features/auth/presentation/pages/reset_password_page.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/pages/statistic_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/introduction/presentation/pages/intro_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  get router => GoRouter(
    initialLocation: '/statistic',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationWidget(child: child);
        },
        routes: [
          GoRoute(
            path: '/splash',
            name: 'splash',
            pageBuilder:
                (context, state) => const NoTransitionPage(child: SplashPage()),
          ),
          GoRoute(
            path: '/intro',
            name: 'intro',
            pageBuilder:
                (context, state) => const NoTransitionPage(child: IntroPage()),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            pageBuilder:
                (context, state) => const NoTransitionPage(child: LoginPage()),
          ),
          GoRoute(
            path: '/register',
            name: 'register',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: RegisterPage()),
          ),
          GoRoute(
            path: '/forgot-password',
            name: 'forgot-password',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: ForgotPasswordPage()),
          ),
          GoRoute(
            path: '/reset-password',
            name: 'reset-password',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: ResetPasswordPage()),
          ),
          GoRoute(
            path: '/new-password',
            name: 'new-password',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: NewPasswordPage()),
          ),
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: DashboardPage()),
          ),
          GoRoute(
            path: '/statistic',
            name: 'statistic',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: StatisticPage()),
          ),
        ],
      ),
    ],
  );
}
