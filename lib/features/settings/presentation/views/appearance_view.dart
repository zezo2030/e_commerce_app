import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Appearance'), centerTitle: true),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Theme Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          state is DarkThemeState ? 'Dark Theme' : 'Light Theme',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          state is DarkThemeState
              ? 'Enable dark mode for a darker appearance'
              : 'Enable light mode for a lighter appearance',
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
        const Text(
          'Theme Preview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildColorItem('Primary', colorScheme.primary),
            _buildColorItem('Secondary', colorScheme.secondary),
            _buildColorItem('Background', colorScheme.surface),
            _buildColorItem('Surface', colorScheme.surface),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sample Button'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
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
                const Text(
                  'Sample Card',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is how cards will appear in the app with the selected theme.',
                ),
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
