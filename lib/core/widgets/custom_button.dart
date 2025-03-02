import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomBtn({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryButton,
          foregroundColor: AppColors.lightText,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: AppTextStyles.buttonTextLarge),
      ),
    );
  }
}
