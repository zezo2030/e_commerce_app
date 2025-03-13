import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState {
  final bool isDarkTheme;

  ThemeState({required this.isDarkTheme});
}

class ThemeCubit extends Cubit<ThemeState> {
  final CacheHelper _cacheHelper = getIt<CacheHelper>();
  static const String _themeKey = 'is_dark_theme';

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryWhite,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryPurple),
      titleTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryPurple,
      secondary: AppColors.accentPurple,
      background: AppColors.scaffoldBackground,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onBackground: AppColors.primaryText,
      onSurface: AppColors.primaryText,
    ),
    cardTheme: const CardTheme(color: AppColors.cardBackground, elevation: 2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryButton,
        foregroundColor: AppColors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primaryPurple),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.accentPurple,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.accentPurple),
      titleTextStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.accentPurple,
      secondary: AppColors.primaryPurple,
      background: Colors.grey[900]!,
      surface: Colors.grey[800]!,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onBackground: AppColors.white,
      onSurface: AppColors.white,
    ),
    cardTheme: CardTheme(color: Colors.grey[800], elevation: 2),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentPurple,
        foregroundColor: AppColors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.accentPurple),
    ),
  );

  ThemeCubit() : super(ThemeState(isDarkTheme: false)) {
    _loadThemeFromPrefs();
  }

  ThemeData get currentTheme => state.isDarkTheme ? darkTheme : lightTheme;

  Future<void> _loadThemeFromPrefs() async {
    final isDark = _cacheHelper.getData(key: _themeKey) as bool?;
    emit(ThemeState(isDarkTheme: isDark ?? false));
  }

  Future<void> toggleTheme() async {
    final newIsDarkTheme = !state.isDarkTheme;
    await _cacheHelper.saveData(key: _themeKey, value: newIsDarkTheme);
    emit(ThemeState(isDarkTheme: newIsDarkTheme));
  }
}
