import 'package:get/get.dart';

import 'package:segarbox_flutter/app/modules/cart/bindings/cart_binding.dart';
import 'package:segarbox_flutter/app/modules/cart/views/cart_view.dart';
import 'package:segarbox_flutter/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:segarbox_flutter/app/modules/checkout/views/checkout_view.dart';
import 'package:segarbox_flutter/app/modules/detail/bindings/detail_binding.dart';
import 'package:segarbox_flutter/app/modules/detail/views/detail_view.dart';
import 'package:segarbox_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:segarbox_flutter/app/modules/home/views/home_view.dart';
import 'package:segarbox_flutter/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:segarbox_flutter/app/modules/onboarding/views/onboarding_view.dart';
import 'package:segarbox_flutter/app/modules/splash/bindings/splash_binding.dart';
import 'package:segarbox_flutter/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
  ];
}
