import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:easy_localization/easy_localization.dart';

class CategorySearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;
  final VoidCallback? onVoiceSearch;

  const CategorySearchBar({
    super.key,
    required this.searchController,
    required this.onChanged,
    this.onVoiceSearch,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchField(
              controller: searchController,
              onChanged: onChanged,
              hintText: 'search_categories'.tr(),
              backgroundColor: theme.inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          if (onVoiceSearch != null) ...[
            SizedBox(width: 8.w),
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                onPressed: onVoiceSearch,
                icon: Icon(
                  Icons.mic,
                  color: theme.colorScheme.primary,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
