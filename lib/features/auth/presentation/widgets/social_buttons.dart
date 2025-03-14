import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onGithubPressed;

  const SocialButtons({
    super.key,
    required this.onGooglePressed,
    required this.onGithubPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onGooglePressed,
            icon: const FaIcon(FontAwesomeIcons.google, size: 20),
            label: const Text('Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onGithubPressed,
            icon: FaIcon(
              FontAwesomeIcons.github,
              size: 20,
              color:
                  theme.brightness == Brightness.light
                      ? Colors.black87
                      : Colors.white70,
            ),
            label: const Text('Github'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
