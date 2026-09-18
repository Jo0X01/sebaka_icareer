import 'package:flutter/material.dart';
import 'package:sebaka/core/di/injector.dart';
import 'package:sebaka/core/routes/app_router.dart';
import 'package:sebaka/core/routes/app_routes.dart';
import 'package:sebaka/core/services/token_storage.dart';

class SebakaApp extends StatelessWidget {
  const SebakaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebaka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE8613C)),
        useMaterial3: true,
      ),
      initialRoute: _initialRoute(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }

  String _initialRoute() {
    return getIt<TokenStorage>().hasToken ? AppRoutes.home : AppRoutes.signup;
  }
}
