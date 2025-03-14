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
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: theme.textTheme.bodyMedium),
        TextButton(
          onPressed: () {
            context.pushReplacement(routeToNavigate);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
