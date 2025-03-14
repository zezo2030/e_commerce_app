import 'package:e_commerce_app/features/categories/data/models/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  final String searchQuery;

  const CategoriesLoaded({required this.categories, this.searchQuery = ''});

  @override
  List<Object?> get props => [categories, searchQuery];
}

class CategoriesError extends CategoriesState {
  final String message;

  const CategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
