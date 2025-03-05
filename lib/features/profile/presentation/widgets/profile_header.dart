import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          // Profile avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/Frame.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // User name
          const Text('zezo saad', style: AppTextStyles.bodyLarge),
          const SizedBox(height: 8),
          // User email
          Text('zezosaad19@gmail.com', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 16),
          // Edit profile button
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to edit profile screen
            },
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
