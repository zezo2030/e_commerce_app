import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomBtn({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: theme.elevatedButtonTheme.style,
        child: Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
