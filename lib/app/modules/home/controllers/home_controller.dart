import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

class HomeController extends GetxController {
  // Fading AppBar
  final ScrollController scrollC = ScrollController();
  final ratio = 0.0.obs;

  // Carousel
  final List<String> carouselImages = [
    'assets/image/promo1.jpg',
    'assets/image/promo2.jpg',
    'assets/image/promo3.jpg',
  ];
  final carouselIndex = 0.obs;

  // Chips
  final List<String> chips = ['Most Popular', 'Vegetables', 'Fruits'];
  final chipsIndex = 0.obs;

  // Navigation Bar
  final currentNavPage = 0.obs;

  // Grid
  final List<String> listTitle = [
    'Broccoli Super Duper Umami Taste',
    'Broccoli Super Duper Umami Taste asdasdasfasdfsad',
    'Broccoli Super Dupe',
    'Broccoli',
    'Broccoli Super Duper Umami',
    'Broccoli Super Duper Umami Taste sadasdsad',
    'Broccoli Super',
    'Broccoli Su',
    'Broccoli Super Duper Umami Taste Wow oMAASDAJN asdjn',
    'Broccoli Super Duper Umam',
  ];

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
