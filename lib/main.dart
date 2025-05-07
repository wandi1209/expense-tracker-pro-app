import 'package:bloc/bloc.dart';
import 'package:expense_tracker_pro/observer.dart';

import 'core/routes/app_router.dart';
import 'service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await init();
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFBFBFB),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
    );
  }
}
