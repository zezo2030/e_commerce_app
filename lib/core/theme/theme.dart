import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';

class AppTheme {
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
      surface: Colors.grey[800]!,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
    ),
    cardTheme: CardTheme(color: Colors.grey[800], elevation: 2),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      selectedItemColor: AppColors.accentPurple,
      selectedIconTheme: const IconThemeData(color: AppColors.white),
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
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryPurple,
      primary: AppColors.primaryPurple,
      secondary: AppColors.accentPurple,
      surface: AppColors.white,
      background: AppColors.scaffoldBackground,
    ),
    cardTheme: const CardTheme(color: AppColors.cardBackground, elevation: 2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryWhite,
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
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.scaffoldBackground,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: AppColors.primaryPurple),
      ),
    ),
  );
}
