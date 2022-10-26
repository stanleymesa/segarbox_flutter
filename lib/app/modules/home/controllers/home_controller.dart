import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

class HomeController extends GetxController {
  final ScrollController scrollC = ScrollController();
  final ratio = 0.0.obs;
  final List<String> carouselImages = [
    'assets/image/promo1.jpg',
    'assets/image/promo2.jpg',
    'assets/image/promo3.jpg',
  ];
  final carouselIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    systemBarColor(statusBarColor: green, navBarColor: defaultWhite);
    scrollC.addListener(() {
      ratio.value = scrollC.offset / (headerHeight - appBarHeight);
      systemBarColor(
          statusBarColor: (ratio.value <= 0.7) ? green : defaultWhite,
          navBarColor: defaultWhite);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollC.dispose();
  }
}
