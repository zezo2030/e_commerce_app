import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/theme/theme.dart';
import 'package:e_commerce_app/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
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
                title: 'app_name'.tr(), // استخدام الترجمة
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                locale: context.locale, // استخدام اللغة من easy_localization
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
              );
            },
          );
        },
      ),
    );
  }
}
