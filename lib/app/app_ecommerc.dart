import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'E-Commerce',
                theme: ThemeCubit.lightTheme,
                darkTheme: ThemeCubit.darkTheme,
                themeMode:
                    themeState.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              );
            },
          );
        },
      ),
    );
  }
}
