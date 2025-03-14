import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return CategoryItem(
            icon: category.icon,
            label: category.name,
            color: _getCategoryColor(context, index),
            onTap: () {
              // Navigate to specific category products
              debugPrint('Navigate to ${category.name} products');
            },
          );
        },
      ),
    );
  }

  // Get category color based on the theme
  Color _getCategoryColor(BuildContext context, int index) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Use original colors for light theme, but adapted colors for dark theme
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

  // Sample categories data - in a real app, this would come from a repository
  final List<CategoryModel> _categories = [
    CategoryModel(
      name: 'Fashion',
      icon: FontAwesomeIcons.shirt,
      color: Colors.transparent, // Color will be set in build
    ),
    CategoryModel(
      name: 'Electronics',
      icon: FontAwesomeIcons.mobileScreen,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Computers',
      icon: FontAwesomeIcons.laptopCode,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Home',
      icon: FontAwesomeIcons.house,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Beauty',
      icon: FontAwesomeIcons.sprayCan,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Sports',
      icon: FontAwesomeIcons.baseball,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Toys',
      icon: FontAwesomeIcons.gamepad,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Books',
      icon: FontAwesomeIcons.book,
      color: Colors.transparent,
    ),
    CategoryModel(
      name: 'Automotive',
      icon: FontAwesomeIcons.car,
      color: Colors.transparent,
    ),
  ];
}

// Simple model class for category data
class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;

  CategoryModel({required this.name, required this.icon, required this.color});
}
