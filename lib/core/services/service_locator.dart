

import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async{

  getIt.registerSingleton<CacheHelper>(CacheHelper());
}