import '../../common/navigations/navigation_widget.dart';
import '../../features/auth/presentation/bloc/authentication_bloc.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/new_password_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/statistic/presentation/bloc/statistic_bloc.dart';
import '../../features/statistic/presentation/pages/statistic_page.dart';
import '../../features/transaction/presentation/bloc/transaction_bloc.dart';
import '../../features/transaction/presentation/pages/transaction_page.dart';
import '../../features/user/presentation/pages/profile_page.dart';
import '../../service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/introduction/presentation/pages/intro_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  get router => GoRouter(
    initialLocation: '/splash',
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
        pageBuilder: (context, state) => NoTransitionPage(child: IntroPage()),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder:
            (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (_) => locator<AuthenticationBloc>(),
                child: const LoginPage(),
              ),
            ),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder:
            (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (_) => locator<AuthenticationBloc>(),
                child: const RegisterPage(),
              ),
            ),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        pageBuilder:
            (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (_) => locator<AuthenticationBloc>(),
                child: const ForgotPasswordPage(),
              ),
            ),
      ),
      GoRoute(
        path: '/reset-password',
        name: 'reset-password',
        pageBuilder:
            (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (context) => locator<AuthenticationBloc>(),
                child: const ResetPasswordPage(),
              ),
            ),
      ),
      GoRoute(
        path: '/new-password',
        name: 'new-password',
        pageBuilder:
            (context, state) =>
                const NoTransitionPage(child: NewPasswordPage()),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => locator<TransactionBloc>()),
            ],
            child: NavigationWidget(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => locator<DashboardBloc>(),
                    child: const DashboardPage(),
                  ),
                ),
          ),
          GoRoute(
            path: '/statistic',
            name: 'statistic',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => locator<StatisticBloc>(),
                    child: const StatisticPage(),
                  ),
                ),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => locator<DashboardBloc>(),
                    child: const ProfilePage(),
                  ),
                ),
          ),
          GoRoute(
            path: '/transactions',
            name: 'transactions',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => locator<TransactionBloc>(),
                    child: const TransactionPage(),
                  ),
                ),
          ),
        ],
      ),
    ],
  );
}
