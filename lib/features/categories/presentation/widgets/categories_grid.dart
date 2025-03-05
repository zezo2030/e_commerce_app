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
            color: category.color,
            onTap: () {
              // Navigate to specific category products
              debugPrint('Navigate to ${category.name} products');
            },
          );
        },
      ),
    );
  }

  // Sample categories data - in a real app, this would come from a repository
  final List<CategoryModel> _categories = [
    CategoryModel(
      name: 'Fashion',
      icon: FontAwesomeIcons.shirt,
      color: Colors.blue,
    ),
    CategoryModel(
      name: 'Electronics',
      icon: FontAwesomeIcons.mobileScreen,
      color: Colors.red,
    ),
    CategoryModel(
      name: 'Computers',
      icon: FontAwesomeIcons.laptopCode,
      color: Colors.purple,
    ),
    CategoryModel(
      name: 'Home',
      icon: FontAwesomeIcons.house,
      color: Colors.orange,
    ),
    CategoryModel(
      name: 'Beauty',
      icon: FontAwesomeIcons.sprayCan,
      color: Colors.pink,
    ),
    CategoryModel(
      name: 'Sports',
      icon: FontAwesomeIcons.baseball,
      color: Colors.green,
    ),
    CategoryModel(
      name: 'Toys',
      icon: FontAwesomeIcons.gamepad,
      color: Colors.amber,
    ),
    CategoryModel(
      name: 'Books',
      icon: FontAwesomeIcons.book,
      color: Colors.teal,
    ),
    CategoryModel(
      name: 'Automotive',
      icon: FontAwesomeIcons.car,
      color: Colors.grey,
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
