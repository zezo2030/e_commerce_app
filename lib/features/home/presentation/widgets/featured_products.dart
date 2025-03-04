import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

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
                'Featured Products',
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
        GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 0.7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ProductCard(
              imageUrl: 'assets/images/Frame.png',
              name: 'Wireless Headphones',
              category: 'Electronics',
              price: 89.99,
              discountPercent: 20,
            ),
            ProductCard(
              imageUrl: "assets/images/Frame.png",
              name: 'Smart Watch',
              category: 'Electronics',
              price: 129.99,
              discountPercent: 0,
            ),
            ProductCard(
              imageUrl: 'assets/images/Frame.png',
              name: 'Summer T-Shirt',
              category: 'Fashion',
              price: 29.99,
              discountPercent: 15,
            ),
            ProductCard(
              imageUrl: 'assets/images/Frame.png',
              name: 'Running Shoes',
              category: 'Sports',
              price: 79.99,
              discountPercent: 0,
            ),
          ],
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final double price;
  final int discountPercent;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.price,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    final discountedPrice = price * (1 - discountPercent / 100);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 130.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (discountPercent > 0)
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      '-$discountPercent%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    size: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      '\$${discountedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    if (discountPercent > 0)
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
