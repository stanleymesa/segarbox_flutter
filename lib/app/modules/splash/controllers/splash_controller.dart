import 'dart:async';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    systemBarColor(navBarColor: defaultWhite);
  }

  @override
  void onReady() {
    super.onReady();
    splashScreen();
  }

  @override
  void onClose() {}

  splashScreen() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.ONBOARDING);
    });
  }
}
