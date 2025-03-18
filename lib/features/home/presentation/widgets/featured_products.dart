import 'package:e_commerce_app/features/home/presentation/model/product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProducts extends StatelessWidget {
  FeaturedProducts({super.key});

  List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: 'wireless_headphones'.tr(),
      desc: 'wireless_headphones_desc'.tr(),
      price: 100,
      discount: 10,
      img: 'assets/images/Frame.png',
      isFavorites: false,
      category: 'electronics',
    ),
    ProductModel(
      id: '2',
      name: 'smart_watch'.tr(),
      desc: 'smart_watch_desc'.tr(),
      price: 100,
      discount: 10,
      img: 'assets/images/Frame.png',
      isFavorites: false,
      category: 'electronics',
    ),
    ProductModel(
      id: '3',
      name: 'summer_tshirt'.tr(),
      desc: 'summer_tshirt_desc'.tr(),
      price: 100,
      discount: 10,
      img: 'assets/images/Frame.png',
      isFavorites: false,
      category: 'fashion',
    ),
    ProductModel(
      id: '4',
      name: 'running_shoes'.tr(),
      desc: 'running_shoes_desc'.tr(),
      price: 100,
      discount: 10,
      img: 'assets/images/Frame.png',
      isFavorites: false,
      category: 'sports',
    ),
  ];

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
                'featured_products'.tr(),
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('see_all'.tr(), style: TextStyle(fontSize: 14.sp)),
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
          children:
              products.map((product) => ProductCard(product: product)).toList(),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final discountedPrice = product.price * (1 - product.discount / 100);

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
                  product.img,
                  height: 130.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (product.discount > 0)
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
                      '-$product.discount%',
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
                  product.category,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  product.name,
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
                    if (product.discount > 0)
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
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
