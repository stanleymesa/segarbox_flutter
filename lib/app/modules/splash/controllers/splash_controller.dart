import 'dart:async';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
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
      Get.offAllNamed(Routes.HOME);
    });
  }
}
