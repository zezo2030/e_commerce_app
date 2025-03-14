import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/features/categories/data/repositories/categories_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _repository;

  CategoriesCubit({required CategoriesRepository repository})
    : _repository = repository,
      super(const CategoriesInitial());

  // تحميل جميع الفئات
  Future<void> loadCategories() async {
    emit(const CategoriesLoading());

    try {
      final categories = await _repository.getCategories();
      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }

  // البحث في الفئات
  Future<void> searchCategories(String query) async {
    // إذا كان في حالة التحميل المسبق، لا تعرض حالة التحميل مرة أخرى
    final currentState = state;
    if (currentState is! CategoriesLoaded) {
      emit(const CategoriesLoading());
    }

    try {
      final filteredCategories = await _repository.searchCategories(query);
      emit(
        CategoriesLoaded(categories: filteredCategories, searchQuery: query),
      );
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }

  // الحصول على لون الفئة بناءً على الفهرس
  Color getCategoryColor(BuildContext context, int index) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // استخدام ألوان أصلية للسمة الفاتحة، وألوان معدلة للسمة الداكنة
    final categoryColors = [
      isDark ? theme.colorScheme.primary : Colors.blue,
      isDark ? theme.colorScheme.secondary : Colors.red,
      isDark ? theme.colorScheme.tertiary : Colors.purple,
      isDark ? theme.colorScheme.primary.withBlue(150) : Colors.orange,
      isDark ? theme.colorScheme.secondary.withRed(220) : Colors.pink,
      isDark ? theme.colorScheme.tertiary.withGreen(180) : Colors.green,
      isDark ? theme.colorScheme.primary.withOpacity(0.8) : Colors.amber,
      isDark ? theme.colorScheme.secondary.withOpacity(0.8) : Colors.teal,
      isDark ? theme.colorScheme.tertiary.withOpacity(0.8) : Colors.grey,
    ];

    return categoryColors[index % categoryColors.length];
  }
}
