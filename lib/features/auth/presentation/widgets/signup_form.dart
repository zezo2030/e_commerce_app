import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/validation/form_validation.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final state = context.watch<AuthCubit>().state;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // First Name
          CustomTextFormField(
            controller: _firstNameController,
            labelText: 'First Name',
            prefixIcon: FontAwesomeIcons.user,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Last Name
          CustomTextFormField(
            controller: _lastNameController,
            labelText: 'Last Name',
            prefixIcon: FontAwesomeIcons.user,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Email
          CustomTextFormField(
            controller: authCubit.emailController,
            labelText: 'Email',
            prefixIcon: FontAwesomeIcons.envelope,
            keyboardType: TextInputType.emailAddress,
            validator: FormValidation.validateEmail,
          ),
          const SizedBox(height: 16),

          // Password
          CustomTextFormField(
            controller: authCubit.passwordController,
            labelText: 'Password',
            prefixIcon: FontAwesomeIcons.lock,
            obscureText: true,
            showPasswordToggle: true,
            validator: FormValidation.validatePassword,
          ),
          const SizedBox(height: 24),

          // Sign Up Button
          state is SignUpLoading
              ? const CircularProgressIndicator(color: AppColors.primaryButton)
              : LoginButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authCubit.signUpWithEmailAndPassword();
                    _formKey.currentState!.reset();
                  }
                },
                text: 'Sign Up',
              ),

          const SizedBox(height: 24),

          // Already have an account section
          const AuthBottomText(
            text: 'Already have an account?',
            buttonText: 'Log In',
            routeToNavigate: Routes.login,
          ),
        ],
      ),
    );
  }
}
