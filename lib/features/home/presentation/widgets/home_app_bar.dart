import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hello_user'.tr(),
                style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                'find_products'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.bell, size: 20.sp),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.cartArrowDown, size: 20.sp),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
