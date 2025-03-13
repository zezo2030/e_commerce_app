import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/forgot_password_page.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_page.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signup_page.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/main/presentation/cubit/main_cubit.dart';
import 'package:e_commerce_app/features/main/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/profile/presentation/views/profile_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce_app/core/router/routes.dart';

import '../../features/settings/presentation/views/appearance_view.dart';

/// App router configuration using go_router
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),

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
      GoRoute(
        path: Routes.main,
        builder:
            (context, state) => BlocProvider(
              create: (context) => MainCubit(),
              child:  MainView(),
            ),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(path: Routes.appearance, builder: (context, state) => AppearanceView()),
    ],
  );
}
