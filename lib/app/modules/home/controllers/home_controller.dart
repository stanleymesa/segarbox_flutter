import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/utils/const.dart';

class HomeController extends GetxController {
  final ScrollController scrollC = ScrollController();
  final ratio = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollC.addListener(() {
      ratio.value = scrollC.offset / (headerHeight - appBarHeight);
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
