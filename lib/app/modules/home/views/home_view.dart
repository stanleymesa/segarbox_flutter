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
              body: Container(),
            ),
            MainAppBar(controller: controller),
          ],
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
