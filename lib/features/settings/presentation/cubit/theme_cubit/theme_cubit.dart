import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState()) {
    _loadTheme();
  }

  final CacheHelper _cacheHelper = getIt<CacheHelper>();
  static const String _themeKey = 'is_dark_theme';

  Future<void> _loadTheme() async {
    final bool? isDark = await _cacheHelper.getData(key: _themeKey) as bool?;
    emit(isDark == true ? DarkThemeState() : LightThemeState());
  }

  Future<void> toggleTheme() async {
    final bool newIsDark = state is LightThemeState;

    await _cacheHelper.saveData(key: _themeKey, value: newIsDark);
    emit(newIsDark ? DarkThemeState() : LightThemeState());
  }
}
