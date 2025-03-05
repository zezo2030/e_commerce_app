import 'package:e_commerce_app/features/home/presentation/widgets/serach_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/categories_section.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/featured_products.dart';
import '../widgets/special_offers.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const HomeAppBar()),
            SliverToBoxAdapter(child: CustomSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: 15.h)),
            SliverToBoxAdapter(child: const CategoriesSection()),
            SliverToBoxAdapter(child: SizedBox(height: 15.h)),
            SliverToBoxAdapter(child: const BannerCarousel()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const FeaturedProducts()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const SpecialOffers()),
            SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          ],
        ),
      ),
    );
  }
}
