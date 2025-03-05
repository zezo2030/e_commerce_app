import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/services/auth_service.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  void _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final user = FirebaseAuth.instance.currentUser;
    final keepLoggedIn = AuthService.getKeepLoggedIn();

    if (user != null && keepLoggedIn) {
      AppRouter.router.pushReplacement('/main');
    } else if (user != null && !keepLoggedIn) {
      await FirebaseAuth.instance.signOut();
      AppRouter.router.pushReplacement('/login');
    } else {
      AppRouter.router.pushReplacement('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Shopy',
          style: AppTextStyles.pacifico64W400,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
