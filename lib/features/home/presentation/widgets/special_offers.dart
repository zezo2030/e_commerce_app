import 'package:e_commerce_app/features/home/presentation/widgets/offer_card.dart';
import 'package:easy_localization/easy_localization.dart';
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
                'special_offers'.tr(),
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
        SizedBox(
          height: 180.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            scrollDirection: Axis.horizontal,
            children: [
              OfferCard(
                title: 'flash_sale'.tr(),
                subtitle: 'up_to_70_off'.tr(),
                backgroundColor: Colors.redAccent,
                icon: FontAwesomeIcons.bolt,
              ),
              OfferCard(
                title: 'free_shipping'.tr(),
                subtitle: 'on_orders_over_50'.tr(),
                backgroundColor: Colors.blueAccent,
                icon: FontAwesomeIcons.truck,
              ),
              OfferCard(
                title: 'new_collection'.tr(),
                subtitle: 'spring_2024'.tr(),
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
