import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'profile_menu_item.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Account section
        _buildSectionHeader(context, 'account'.tr()),
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'account_information'.tr(),
          onTap: () {
            // Navigate to account information
          },
        ),
        ProfileMenuItem(
          icon: Icons.shopping_bag_outlined,
          title: 'my_orders'.tr(),
          onTap: () {
            // Navigate to orders
          },
        ),
        ProfileMenuItem(
          icon: Icons.location_on_outlined,
          title: 'delivery_addresses'.tr(),
          onTap: () {
            // Navigate to delivery addresses
          },
        ),
        ProfileMenuItem(
          icon: Icons.payment_outlined,
          title: 'payment_methods'.tr(),
          onTap: () {
            // Navigate to payment methods
          },
        ),
        const Divider(height: 40),

        // Settings section
        _buildSectionHeader(context, 'settings'.tr()),
        ProfileMenuItem(
          icon: Icons.notifications_outlined,
          title: 'notifications'.tr(),
          onTap: () {
            // Navigate to notifications settings
          },
          trailing: Switch(
            value: true,
            onChanged: (value) {
              // Handle notification toggle
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
        ProfileMenuItem(
          icon: Icons.language_outlined,
          title: 'language'.tr(),
          onTap: () {
            // Navigate to language settings
            context.push(Routes.language);
          },
        ),
        ProfileMenuItem(
          icon: Icons.dark_mode_outlined,
          title: 'appearance'.tr(),
          onTap: () {
            // Navigate to theme settings
            context.push(Routes.appearance);
          },
        ),
        const Divider(height: 40),

        // Help & Support section
        _buildSectionHeader(context, 'help_support'.tr()),
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: 'faqs'.tr(),
          onTap: () {
            // Navigate to FAQs
          },
        ),
        ProfileMenuItem(
          icon: Icons.headset_mic_outlined,
          title: 'contact_support'.tr(),
          onTap: () {
            // Navigate to support
          },
        ),
        ProfileMenuItem(
          icon: Icons.policy_outlined,
          title: 'privacy_policy'.tr(),
          onTap: () {
            // Navigate to privacy policy
          },
        ),
        ProfileMenuItem(
          icon: Icons.description_outlined,
          title: 'terms_of_service'.tr(),
          onTap: () {
            // Navigate to terms of service
          },
        ),
        const Divider(height: 40),

        // Logout section
        ProfileMenuItem(
          icon: Icons.logout,
          title: 'logout'.tr(),
          onTap: () async {
            // Handle logout
            await context.read<AuthCubit>().signOut();
            context.pushReplacement(Routes.login);
          },
          iconColor: Colors.red,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
