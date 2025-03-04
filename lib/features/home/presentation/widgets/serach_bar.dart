import 'package:e_commerce_app/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final String? hintText;

  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.hintText = 'Search products...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 14.sp),
      ),
    ).paddingHorizontal(16.w);
  }
}
