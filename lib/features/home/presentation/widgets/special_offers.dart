import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Offers',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See All', style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 180.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            scrollDirection: Axis.horizontal,
            children: const [
              OfferCard(
                title: 'Flash Sale',
                subtitle: 'Up to 70% off',
                backgroundColor: Colors.redAccent,
                icon: FontAwesomeIcons.bolt,
              ),
              OfferCard(
                title: 'Free Shipping',
                subtitle: 'On orders over \$50',
                backgroundColor: Colors.blueAccent,
                icon: FontAwesomeIcons.truck,
              ),
              OfferCard(
                title: 'New Collection',
                subtitle: 'Spring 2024',
                backgroundColor: Colors.greenAccent,
                icon: FontAwesomeIcons.tag,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;

  const OfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    color: backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: FaIcon(icon, color: Colors.white, size: 60.sp),
          ),
        ],
      ),
    );
  }
}
