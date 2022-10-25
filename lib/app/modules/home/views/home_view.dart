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
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  toolbarHeight: headerHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipPath(
                      clipper: Header(),
                      child: Container(
                        color: green,
                      ),
                    ),
                  ),
                ),
              ],
              body: Container(),
            ),
            Obx(
              () => Container(
                color: defaultWhite.withOpacity((controller.ratio.value <= 1.0)
                    ? controller.ratio.value
                    : 1.0),
                child: Column(
                  children: [
                    Text(
                      'RATIO: ${controller.ratio.value}',
                      style: (controller.ratio.value <= 0.5)
                          ? normalLight
                          : normalDark,
                    )
                  ],
                ),
                height: appBarHeight,
                width: Get.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..lineTo(0, size.height - 36)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 36)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
