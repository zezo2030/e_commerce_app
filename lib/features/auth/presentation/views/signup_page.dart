import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully!')),
            );
            context.pushReplacement(Routes.main);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo or App Title
                  const Text('Create Account', style: AppTextStyles.heading2),
                  const SizedBox(height: 40),

                  // Sign Up Form
                  const SignupForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
