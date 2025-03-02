import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextBtn({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryButton,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
