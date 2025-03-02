import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/core/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const String _keepLoggedInKey = 'keep_logged_in';

  // حفظ حالة "احتفظ بتسجيل دخولي"
  static Future<bool> saveKeepLoggedIn(bool keepLoggedIn) async {
    return await getIt<CacheHelper>().saveData(
      key: _keepLoggedInKey,
      value: keepLoggedIn,
    );
  }

  // الحصول على حالة "احتفظ بتسجيل دخولي"
  static bool getKeepLoggedIn() {
    return getIt<CacheHelper>().getData(key: _keepLoggedInKey) ?? false;
  }

  // التحقق مما إذا كان المستخدم مسجل الدخول ويجب الاحتفاظ بتسجيل دخوله
  static bool shouldStayLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    final keepLoggedIn = getKeepLoggedIn();

    return user != null && keepLoggedIn;
  }

  // تسجيل الخروج وإعادة تعيين حالة "احتفظ بتسجيل دخولي"
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await saveKeepLoggedIn(false);
  }
}
