import 'package:get/get.dart';

import 'package:segarbox_flutter/app/modules/address/bindings/address_binding.dart';
import 'package:segarbox_flutter/app/modules/address/views/address_view.dart';
import 'package:segarbox_flutter/app/modules/allproducts/bindings/allproducts_binding.dart';
import 'package:segarbox_flutter/app/modules/allproducts/views/allproducts_view.dart';
import 'package:segarbox_flutter/app/modules/cart/bindings/cart_binding.dart';
import 'package:segarbox_flutter/app/modules/cart/views/cart_view.dart';
import 'package:segarbox_flutter/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:segarbox_flutter/app/modules/checkout/views/checkout_view.dart';
import 'package:segarbox_flutter/app/modules/detail/bindings/detail_binding.dart';
import 'package:segarbox_flutter/app/modules/detail/views/detail_view.dart';
import 'package:segarbox_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:segarbox_flutter/app/modules/home/views/home_view.dart';
import 'package:segarbox_flutter/app/modules/invoice/bindings/invoice_binding.dart';
import 'package:segarbox_flutter/app/modules/invoice/views/invoice_view.dart';
import 'package:segarbox_flutter/app/modules/login/bindings/login_binding.dart';
import 'package:segarbox_flutter/app/modules/login/views/login_view.dart';
import 'package:segarbox_flutter/app/modules/maps/bindings/maps_binding.dart';
import 'package:segarbox_flutter/app/modules/maps/views/maps_view.dart';
import 'package:segarbox_flutter/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:segarbox_flutter/app/modules/onboarding/views/onboarding_view.dart';
import 'package:segarbox_flutter/app/modules/rating/bindings/rating_binding.dart';
import 'package:segarbox_flutter/app/modules/rating/views/rating_view.dart';
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
    GetPage(
      name: _Paths.ADDRESS,
      page: () => AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => MapsView(),
      binding: MapsBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.RATING,
      page: () => RatingView(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: _Paths.ALLPRODUCTS,
      page: () => AllproductsView(),
      binding: AllproductsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
