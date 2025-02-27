import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onGooglePressed,
            icon: const FaIcon(FontAwesomeIcons.google, size: 20),
            label: const Text('Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryButton,
              foregroundColor: Colors.black87,
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
            icon: const FaIcon(
              FontAwesomeIcons.github,
              size: 20,
              color: AppColors.githubBlue,
            ),
            label: const Text('Github'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryButton,
              foregroundColor: Colors.black87,
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
