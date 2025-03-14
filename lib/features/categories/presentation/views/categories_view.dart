import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/features/categories/domain/cubit/categories_cubit.dart';
import '../widgets/category_header.dart';
import '../widgets/category_search_bar.dart';
import '../widgets/categories_grid.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController _searchController = TextEditingController();
  late final CategoriesCubit _categoriesCubit;

  @override
  void initState() {
    super.initState();
    _categoriesCubit = getIt<CategoriesCubit>();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    await _categoriesCubit.loadCategories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _categoriesCubit.searchCategories(query);
  }

  void _handleVoiceSearch() {
    // In a real app, this would implement speech-to-text functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('voice_search_not_implemented'.tr()),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFilterBottomSheet() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'filter_categories'.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                // Add filter options here
                Wrap(
                  spacing: 8.w,
                  children: [
                    _buildFilterChip('popular'.tr()),
                    _buildFilterChip('new'.tr()),
                    _buildFilterChip('a_z'.tr()),
                    _buildFilterChip('z_a'.tr()),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: theme.elevatedButtonTheme.style,
                    child: Text('apply_filters'.tr()),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      onSelected: (selected) {
        // Handle filter selection
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _categoriesCubit,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              CategoryHeader(onFilterTap: _showFilterBottomSheet),
              SizedBox(height: 16.h),
              CategorySearchBar(
                searchController: _searchController,
                onChanged: _onSearchChanged,
                onVoiceSearch: _handleVoiceSearch,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadCategories,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: const CategoriesGrid(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
