import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/profile_controller.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  void resetProfileImage() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.scrollOffset.value = 0;
      },
    );
  }

  void setStatusBarColor() {
    Future.delayed(
      200.milliseconds,
      () => systemBarColor(
          statusBarColor: controller.color.value, navBarColor: defaultWhite),
    );
  }

  @override
  Widget build(BuildContext context) {
    resetProfileImage();
    setStatusBarColor();
    return WillPopScope(
      onWillPop: () async {
        homeController.currentNavPage.value = 0;
        return false;
      },
      child: Stack(
        children: [
          NestedScrollView(
            controller: controller.scrollC,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                expandedHeight: expandedHeight,
                backgroundColor: defaultWhite,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/image/japan.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            body: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 400,
                    color: Colors.cyan,
                  ),
                  Container(
                    height: 400,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          ProfileImage(
            profileController: controller,
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.profileController})
      : super(key: key);

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return AnimatedProfileImage(profileController: profileController);
  }
}

class AnimatedProfileImage extends StatelessWidget {
  const AnimatedProfileImage({
    Key? key,
    required this.profileController,
  }) : super(key: key);

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: max(defaultTop - profileController.scrollOffset.value, 0),
        left: 24,
        child: AnimatedContainer(
          duration: 200.milliseconds,
          width: (profileController.scrollOffset.value <= defaultTop / 2)
              ? diameter
              : 0,
          height: (profileController.scrollOffset.value <= defaultTop / 2)
              ? diameter
              : 0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
