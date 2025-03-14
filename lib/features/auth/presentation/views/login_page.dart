import 'package:e_commerce_app/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/custom_login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Text(
                      'Welcome Back',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    const CustomLoginForm(),
                    const SizedBox(height: 40),
                    const Center(
                      child: AuthBottomText(
                        text: 'Don\'t have an account?',
                        buttonText: 'Sign Up',
                        routeToNavigate: Routes.register,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
