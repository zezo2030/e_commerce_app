import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? height;
  final EdgeInsets? contentPadding;
  final BorderRadius? borderRadius;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search',
    this.backgroundColor,
    this.iconColor,
    this.height,
    this.contentPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.inputFill,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.secondaryText.withOpacity(0.6),
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: iconColor ?? AppColors.secondaryText.withOpacity(0.7),
            size: 20.sp,
          ),
          suffixIcon:
              controller.text.isNotEmpty
                  ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color:
                          iconColor ?? AppColors.secondaryText.withOpacity(0.7),
                      size: 20.sp,
                    ),
                    onPressed: () {
                      controller.clear();
                      onChanged('');
                    },
                  )
                  : null,
          border: InputBorder.none,
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
      ),
    );
  }
}
