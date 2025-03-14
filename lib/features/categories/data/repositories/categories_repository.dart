import 'package:e_commerce_app/features/categories/data/models/category_model.dart';

abstract class CategoriesRepository {
  /// Gets all available categories.
  Future<List<CategoryModel>> getCategories();

  /// Gets a specific category by ID.
  Future<CategoryModel?> getCategoryById(String id);

  /// Searches categories based on a query.
  Future<List<CategoryModel>> searchCategories(String query);
}
