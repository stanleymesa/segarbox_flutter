import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              controller: controller.scrollC,
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                Header(),
              ],
              body: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  Carousel(controller: controller),
                  SizedBox(
                    height: 16,
                  ),
                  CarouselIndicator(controller: controller),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 500,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 500,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            MainAppBar(controller: controller),
          ],
        ),
      ),
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.carouselImages.length,
        (index) => Obx(
          () => AnimatedContainer(
            duration: 300.milliseconds,
            margin: EdgeInsets.only(right: 4),
            width: (controller.carouselIndex.value == index) ? 32 : 8,
            height: 8,
            decoration: BoxDecoration(
              color:
                  (controller.carouselIndex.value == index) ? green : softGreen,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) =>
            controller.carouselIndex.value = index,
        viewportFraction: 0.9,
        height: 132,
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.asset(
          controller.carouselImages[index],
          width: Get.width - 52,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          height: appBarHeight,
          width: Get.width,
          color: defaultWhite.withOpacity(
              (controller.ratio.value <= 1.0) ? controller.ratio.value : 1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor:
                        (controller.ratio.value <= 0.5) ? defaultWhite : black,
                    style: (controller.ratio.value <= 0.5)
                        ? normalLight
                        : normalDark,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: (controller.ratio.value <= 0.5)
                          ? normalLight
                          : normalDark,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18,
                        color: (controller.ratio.value <= 0.5)
                            ? defaultWhite
                            : black,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (controller.ratio.value <= 0.5)
                                ? defaultWhite
                                : black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (controller.ratio.value <= 0.5)
                                ? defaultWhite
                                : black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.shopping_cart_rounded,
                  color: (controller.ratio.value <= 0.5) ? defaultWhite : black,
                )
              ],
            ),
          )),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: headerHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
        ),
      ),
    );
  }
}
