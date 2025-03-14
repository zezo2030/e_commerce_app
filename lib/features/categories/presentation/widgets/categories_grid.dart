import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/features/categories/domain/cubit/categories_cubit.dart';
import 'package:e_commerce_app/features/categories/domain/cubit/categories_state.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return _buildLoadingIndicator();
        }

        if (state is CategoriesError) {
          return _buildErrorWidget(state.message);
        }

        if (state is CategoriesLoaded) {
          if (state.categories.isEmpty) {
            return _buildEmptyState();
          }

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
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final cubit = context.read<CategoriesCubit>();
                final category = state.categories[index];
                return CategoryItem(
                  icon: category.icon,
                  label: category.name.tr(),
                  color: cubit.getCategoryColor(context, index),
                  onTap: () {
                    // Navigate to specific category products
                    debugPrint('Navigate to ${category.name} products');
                  },
                );
              },
            ),
          );
        }

        return _buildEmptyState();
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 16.h),
            Text(
              'error_loading_categories'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.category_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              'no_categories_found'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
