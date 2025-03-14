import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text(
            'categories'.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 100.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            scrollDirection: Axis.horizontal,
            children: [
              CategoryItem(
                icon: FontAwesomeIcons.shirt,
                label: 'fashion'.tr(),
                color: Colors.blue,
              ),
              CategoryItem(
                icon: FontAwesomeIcons.mobileScreen,
                label: 'electronics'.tr(),
                color: Colors.red,
              ),
              CategoryItem(
                icon: FontAwesomeIcons.laptopCode,
                label: 'computers'.tr(),
                color: Colors.purple,
              ),
              CategoryItem(
                icon: FontAwesomeIcons.house,
                label: 'home'.tr(),
                color: Colors.orange,
              ),
              CategoryItem(
                icon: FontAwesomeIcons.sprayCan,
                label: 'beauty'.tr(),
                color: Colors.pink,
              ),
              CategoryItem(
                icon: FontAwesomeIcons.baseball,
                label: 'sports'.tr(),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(child: FaIcon(icon, color: color, size: 24.sp)),
          ),
          SizedBox(height: 8.h),
          Text(label, style: TextStyle(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
