import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/validation/form_validation.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/login_button.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _keepLoggedIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInWithGithubSuccess ||
            state is SignInWithGoogleSuccess) {
          AppRouter.router.pushReplacement('/home');
        }
      },
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: authCubit.emailController,
                labelText: 'Email',
                prefixIcon: FontAwesomeIcons.envelope,
                keyboardType: TextInputType.emailAddress,
                validator: FormValidation.validateEmail,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: authCubit.passwordController,
                labelText: 'Password',
                prefixIcon: FontAwesomeIcons.lock,
                obscureText: true,
                showPasswordToggle: true,
                validator: FormValidation.validatePassword,
              ),
              const SizedBox(height: 16),

              // Keep me logged in checkbox
              Row(
                children: [
                  Checkbox(
                    value: _keepLoggedIn,
                    onChanged: (value) {
                      setState(() {
                        _keepLoggedIn = value ?? false;
                      });
                    },
                    activeColor: AppColors.primaryButton,
                  ),
                  const Text(
                    'Keep me logged in',
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              LoginButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authCubit.signInWithEmailAndPassword(
                      keepLoggedIn: _keepLoggedIn,
                    );
                  }
                },
              ),
              const SizedBox(height: 50),
              const DividerWithText(text: 'OR'),
              const SizedBox(height: 24),

              // Social buttons or other login options
              if (state is SignInWithGithubLoading ||
                  state is SignInWithGoogleLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryButton,
                  ),
                )
              else
                SocialButtons(
                  onGooglePressed: () {
                    authCubit.signInWithGoogle();
                  },
                  onGithubPressed: () {
                    authCubit.signInWithGithub();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
