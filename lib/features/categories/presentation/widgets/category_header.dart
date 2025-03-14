import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

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
            'categories'.tr(),
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
