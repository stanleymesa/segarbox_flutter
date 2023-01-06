import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  // Dark Mode
  void getIsDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    Get.changeThemeMode(
      await prefs.getBool(darkModeCode) ?? false
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }

  @override
  void onInit() {
    super.onInit();
    getIsDarkMode();
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
