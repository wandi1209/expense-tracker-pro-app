import 'package:expense_tracker_pro/features/auth/presentation/pages/register_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/introduction/presentation/pages/intro_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  get router => GoRouter(
    initialLocation: '/register',
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
            (context, state) => const NoTransitionPage(child: RegisterPage()),
      ),
    ],
  );
}
