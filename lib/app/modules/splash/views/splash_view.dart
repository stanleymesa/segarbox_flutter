import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/lottie/splash_light.json',
          fit: BoxFit.cover,
          frameRate: FrameRate.max,
        ),
      ),
    );
  }
}
