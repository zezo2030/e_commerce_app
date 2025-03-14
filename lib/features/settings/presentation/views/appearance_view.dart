import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('appearance'.tr()), centerTitle: true),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'theme_settings'.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildThemeSelector(context, state),
                const SizedBox(height: 30),
                _buildColorPreview(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemeSelector(BuildContext context, ThemeState state) {
    return Card(
      elevation: 4,
      child: SwitchListTile(
        title: Text(
          state is DarkThemeState ? 'dark_theme'.tr() : 'light_theme'.tr(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          state is DarkThemeState
              ? 'enable_dark_mode'.tr()
              : 'enable_light_mode'.tr(),
        ),
        secondary: Icon(
          state is DarkThemeState ? Icons.dark_mode : Icons.light_mode,
          color:
              state is DarkThemeState
                  ? AppColors.accentPurple
                  : AppColors.primaryPurple,
        ),
        value: state is DarkThemeState,
        onChanged: (_) {
          context.read<ThemeCubit>().toggleTheme();
        },
        activeColor: AppColors.accentPurple,
      ),
    );
  }

  Widget _buildColorPreview(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'theme_preview'.tr(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildColorItem('primary'.tr(), colorScheme.primary),
            _buildColorItem('secondary'.tr(), colorScheme.secondary),
            _buildColorItem('background'.tr(), colorScheme.surface),
            _buildColorItem('surface'.tr(), colorScheme.surface),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('sample_button'.tr()),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text('text_button'.tr())),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {},
              child: Text('outlined_button'.tr()),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'sample_card'.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text('card_description'.tr()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorItem(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
