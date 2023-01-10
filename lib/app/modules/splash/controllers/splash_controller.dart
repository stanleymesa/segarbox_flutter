import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  // Dark Mode
  void getIsDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = await prefs.getBool(darkModeCode) ?? false;
    Get.changeThemeMode(
      isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
    systemBarColor(
        navBarColor: isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  @override
  void onInit() {
    super.onInit();
    getIsDarkMode();
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
