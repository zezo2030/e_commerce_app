import 'package:e_commerce_app/features/categories/data/models/category_model.dart';
import 'package:e_commerce_app/features/categories/data/repositories/categories_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MockCategoriesRepository implements CategoriesRepository {
  // Mock categories data
  final List<CategoryModel> _categories = [
    CategoryModel(id: '1', name: 'fashion', icon: FontAwesomeIcons.shirt),
    CategoryModel(
      id: '2',
      name: 'electronics',
      icon: FontAwesomeIcons.mobileScreen,
    ),
    CategoryModel(
      id: '3',
      name: 'computers',
      icon: FontAwesomeIcons.laptopCode,
    ),
    CategoryModel(id: '4', name: 'home', icon: FontAwesomeIcons.house),
    CategoryModel(id: '5', name: 'beauty', icon: FontAwesomeIcons.sprayCan),
    CategoryModel(id: '6', name: 'sports', icon: FontAwesomeIcons.baseball),
    CategoryModel(id: '7', name: 'toys', icon: FontAwesomeIcons.gamepad),
    CategoryModel(id: '8', name: 'books', icon: FontAwesomeIcons.book),
    CategoryModel(id: '9', name: 'automotive', icon: FontAwesomeIcons.car),
  ];

  @override
  Future<List<CategoryModel>> getCategories() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _categories;
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _categories.firstWhere(
      (category) => category.id == id,
      orElse: () => throw Exception('Category not found'),
    );
  }

  @override
  Future<List<CategoryModel>> searchCategories(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) {
      return _categories;
    }

    return _categories
        .where(
          (category) =>
              category.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
