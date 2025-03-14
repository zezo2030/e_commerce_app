import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/categories/presentation/views/categories_view.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/main/presentation/cubit/main_cubit.dart';
import 'package:e_commerce_app/features/profile/presentation/views/profile_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final List<Widget> screens = [
    const HomeView(),
    const CategoriesView(),
    const CartView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<MainCubit>().changeIndex(index),
            selectedItemColor: AppColors.primaryButton,
            selectedLabelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            elevation: 10,
            selectedIconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
              size: 24.sp,
            ),
            unselectedIconTheme: IconThemeData(color: Colors.grey, size: 24.sp),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: 'categories'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'cart'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: 'favorites'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'profile'.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
