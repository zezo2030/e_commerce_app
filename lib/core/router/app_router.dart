import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/forgot_password_page.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_page.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signup_page.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce_app/core/router/routes.dart';

/// App router configuration using go_router
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      // Splash and onboarding
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),

      // Auth routes
      GoRoute(
        path: Routes.login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(context),
              child: const LoginPage(),
            ),
      ),

      GoRoute(
        path: Routes.register,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(context),
              child: const SignupPage(),
            ),
      ),

      GoRoute(
        path: Routes.forgotPassword,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(context),
              child: ForgotPasswordPage(),
            ),
      ),

      GoRoute(path: Routes.home, builder: (context, state) => const HomeView()),
    ],
  );
}
