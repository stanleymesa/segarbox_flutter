import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  // Status Bar
  final color = defaultWhite.obs;

  // void getImagePalette(ImageProvider imageProvider) async {
  //   final PaletteGenerator paletteGenerator =
  //       await PaletteGenerator.fromImageProvider(imageProvider);
  //   color.value = await paletteGenerator.dominantColor?.color ?? defaultWhite;
  // }

  void setSystemBar() {
    AppTheme.systemBarColor(
        navBarColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  // Scroll
  final ScrollController scrollC = ScrollController();
  final scrollOffset = 0.0.obs;

  // Dark Mode
  final isDarkMode = Get.isDarkMode ? true.obs : false.obs;

  void saveIsDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeCode, isDarkMode);
  }

  // Logout
  void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenCode);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getImagePalette(AssetImage('assets/image/japan.jpg'));
    scrollC.addListener(() {
      scrollOffset.value = scrollC.offset;
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
