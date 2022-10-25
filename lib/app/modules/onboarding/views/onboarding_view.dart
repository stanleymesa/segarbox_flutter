import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (value) => controller.currentPage.value = value,
              itemCount: controller.onBoarding.length,
              itemBuilder: ((context, index) => OnBoardingInfo(
                    controller: controller,
                    index: index,
                  )),
            ),
            Indicator(controller: controller),
            Skip(),
          ],
        ),
      ),
    );
  }
}

class Skip extends StatelessWidget {
  const Skip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      top: 16,
      child: GestureDetector(
        onTap: () => Get.offAllNamed(Routes.HOME),
        child: Icon(
          Icons.double_arrow_rounded,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.onBoarding.length,
          (index) {
            return Obx(
              () => AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 4),
                duration: 500.milliseconds,
                width: (index == controller.currentPage.value) ? 32 : 8,
                height: 8,
                decoration: BoxDecoration(
                    color: (index == controller.currentPage.value)
                        ? Colors.black87
                        : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OnBoardingInfo extends StatelessWidget {
  const OnBoardingInfo({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final OnboardingController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AnimatedPadding(
          duration: 500.milliseconds,
          padding: EdgeInsets.fromLTRB(
              36, 0, 36, (index == controller.currentPage.value) ? 0 : 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                controller.onBoarding[index].image,
                fit: BoxFit.fill,
              ),
              Text(
                controller.onBoarding[index].title,
                style: title,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                controller.onBoarding[index].desc,
                style: normalDark,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedOpacity(
                duration: 500.milliseconds,
                opacity: (controller.currentPage.value ==
                        controller.onBoarding.length - 1)
                    ? 1
                    : 0,
                child: GestureDetector(
                  onTap: () => (index == controller.onBoarding.length - 1)
                      ? Get.offAllNamed(Routes.HOME)
                      : {},
                  child: Text(
                    'Get Started',
                    style: title.copyWith(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
