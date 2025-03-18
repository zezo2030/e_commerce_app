import 'package:e_commerce_app/app/app_ecommerc.dart';
import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // setup Service Locator
  await setupServiceLocator();
  await getIt<CacheHelper>().init();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      useOnlyLangCode: true,
      child: const ECommerceApp(),
    ),
  );
}
