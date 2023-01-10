import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

class InvoiceController extends GetxController {
  void setSystemBar() {
    AppTheme.systemBarColor(
        navBarColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  @override
  void onInit() {
    super.onInit();
    setSystemBar();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
