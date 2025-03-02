import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/validation/form_validation.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_btn.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SendPasswordResetEmailSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Password reset link has been sent to your email',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                AppRouter.router.pushReplacement(Routes.login);
              }
            },
            builder: (context, state) {
              final authCubit = context.read<AuthCubit>();
              return Form(
                key: _formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 150)),
                    SliverToBoxAdapter(
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.heading2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(
                      child: Text(
                        'Enter your email and we will send you a link to reset your password',
                        style: AppTextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 70)),
                    SliverToBoxAdapter(
                      child: CustomTextFormField(
                        controller: authCubit.emailController,
                        labelText: 'Email',
                        prefixIcon: FontAwesomeIcons.envelope,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormValidation.validateEmail,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(
                      child:
                          state is SendPasswordResetEmailLoading
                              ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryButton,
                                ),
                              )
                              : CustomBtn(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    authCubit.sendPasswordResetEmail();
                                  }
                                },
                                text: 'Reset Password',
                              ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(
                      child: CustomTextBtn(
                        text: 'Back to Login',
                        onPressed: () => AppRouter.router.pop(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
