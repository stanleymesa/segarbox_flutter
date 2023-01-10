import 'package:get/get.dart';
import 'package:segarbox_flutter/app/data/models/onboarding.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';

class OnboardingController extends GetxController {
  final List<OnBoarding> onBoarding = [
    OnBoarding(
        image: 'assets/lottie/grocery.json',
        title: 'Buy Groceries',
        desc:
            'Choose your meals, Plan your groceries, and pick the best products that suit you!'),
    OnBoarding(
        image: 'assets/lottie/save_money.json',
        title: 'Save Money',
        desc:
            "Don't hesitate to buy our product. We give you the best price, we guarantee!"),
    OnBoarding(
        image: 'assets/lottie/fresh.json',
        title: 'Stay Fresh',
        desc:
            'We prioritize freshness, just wait in your place and we will bring your products as fast as we can!'),
  ];

  final currentPage = 0.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    systemBarColor(
        navBarColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
