import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebaka/core/di/injector.dart';
import 'package:sebaka/core/routes/app_routes.dart';
import 'package:sebaka/features/home/presentation/ui/home_screen.dart';
import 'package:sebaka/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:sebaka/features/signup/presentation/ui/signup_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SignupCubit(getIt()),
            child: const SignupScreen(),
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
