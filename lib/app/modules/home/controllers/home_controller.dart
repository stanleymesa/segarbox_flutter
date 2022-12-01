import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/data/models/user.dart';
import 'package:segarbox_flutter/app/modules/home/providers/home_provider.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<UserResponse> {
  // Fading AppBar
  final ScrollController scrollC = ScrollController();
  final ratio = 0.0.obs;
  void setSystemBar() {
    systemBarColor(
        statusBarColor: (ratio.value <= 0.7) ? green : defaultWhite,
        navBarColor: defaultWhite);
  }

  void resetHomeAppBar() {
    ratio.value = 0;
    systemBarColor(
        statusBarColor: (ratio.value <= 0.7) ? green : defaultWhite,
        navBarColor: defaultWhite);
  }

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

  // User
  final HomeProvider homeProvider = HomeProvider();
  final user = UserResponse().obs;
  final isUserLoading = true.obs;
  final isUserError = {
    'isError': false,
    'error': '',
  }.obs;

  // Prefs
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(tokenCode) ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    scrollC.addListener(() {
      ratio.value = scrollC.offset / (headerHeight - appBarHeight);
      setSystemBar();
    });

    isUserLoading.value = true;
    change(null, status: RxStatus.loading());
    homeProvider.fetchUsers().then(
      (value) {
        user.value = value;
        isUserLoading.value = false;

        if (value.data != null) {
          if (value.data!.isNotEmpty) {
            change(value, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          change(null, status: RxStatus.empty());
        }
      },
      onError: (error) {
        isUserLoading.value = false;
        isUserError.value = {
          'isError': true,
          'error': error.toString(),
        };

        change(null, status: RxStatus.error(error.toString()));
      },
    );
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
