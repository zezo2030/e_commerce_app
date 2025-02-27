import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthBottomText extends StatelessWidget {
  final String text;
  final String buttonText;
  final String routeToNavigate;

  const AuthBottomText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.routeToNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyles.bodyMedium),
        TextButton(
          onPressed: () {
            context.pushReplacement(routeToNavigate);
          },
          child: Text(buttonText, style: AppTextStyles.linkText),
        ),
      ],
    );
  }
}
