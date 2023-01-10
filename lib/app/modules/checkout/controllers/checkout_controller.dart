import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    AppTheme.systemBarColor(
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
  void increment() => count.value++;
}
