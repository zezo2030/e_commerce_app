import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHeader extends StatelessWidget {
  final VoidCallback onFilterTap;

  const CategoryHeader({super.key, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Categories',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onFilterTap,
            icon: Icon(
              Icons.filter_list,
              size: 24.sp,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
