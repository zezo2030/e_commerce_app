/// Route path constants for the application
class Routes {
  // Auth routes
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Main app flow
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String profile = '/profile';

  // Additional routes
  static const String productDetails = '/home/product/:id';
  static const String search = '/search';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String orderDetails = '/orders/:id';
  static const String settings = '/settings';
}

/// Route name constants for named routes
class RouteNames {
  static const String login = 'login';
  static const String home = 'home';
  static const String productDetails = 'productDetails';
  static const String cart = 'cart';
  static const String profile = 'profile';
  static const String checkout = 'checkout';
  static const String orders = 'orders';
  static const String orderDetails = 'orderDetails';
}
