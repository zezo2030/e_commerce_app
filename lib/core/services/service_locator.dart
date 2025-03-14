import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/features/categories/data/repositories/categories_repository.dart';
import 'package:e_commerce_app/features/categories/data/repositories/mock_categories_repository.dart';
import 'package:e_commerce_app/features/categories/domain/cubit/categories_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // Repositories
  getIt.registerSingleton<CategoriesRepository>(MockCategoriesRepository());

  // Cubits
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(repository: getIt<CategoriesRepository>()),
  );
}
