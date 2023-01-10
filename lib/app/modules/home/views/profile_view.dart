import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/profile_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    controller.scrollOffset.value = 0;
    controller.setSystemBar();
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
                pinned: false,
                expandedHeight: expandedHeight,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/image/japan.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
            ],
            body: ListView(
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: (diameter / 2) + 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Agus Surmono Pakiyem Tuminah',
                          style: (controller.isDarkMode.value)
                              ? Get.textTheme.headlineLarge!
                                  .copyWith(color: AppColorTheme.defaultWhite)
                              : Get.textTheme.headlineLarge!
                                  .copyWith(color: AppColorTheme.defaultBlack),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'agussumono@gmail.com',
                          style: Get.textTheme.headline1!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My Cart',
                                      style: (controller.isDarkMode.value)
                                          ? Get.textTheme.headline1!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColorTheme.defaultWhite)
                                          : Get.textTheme.headline1!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColorTheme.defaultBlack),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColorTheme.green,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.RATING),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rating',
                                      style: (controller.isDarkMode.value)
                                          ? Get.textTheme.headline1!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColorTheme.defaultWhite)
                                          : Get.textTheme.headline1!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColorTheme.defaultBlack),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColorTheme.green,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dark Mode',
                              style: (controller.isDarkMode.value)
                                  ? Get.textTheme.headline1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColorTheme.defaultWhite)
                                  : Get.textTheme.headline1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColorTheme.defaultBlack),
                            ),
                            SizedBox(
                              width: 50,
                              height: 20,
                              child: Obx(
                                () => Switch(
                                    value: controller.isDarkMode.value,
                                    activeColor: AppColorTheme.green,
                                    activeTrackColor: Color(0x52000000),
                                    onChanged: (value) async {
                                      controller.isDarkMode.value = value;
                                      controller.saveIsDarkMode(value);
                                      Get.changeThemeMode(
                                        value
                                            ? ThemeMode.dark
                                            : ThemeMode.light,
                                      );
                                      AppTheme.systemBarColor(
                                          navBarColor: value
                                              ? AppColorTheme.defaultBlack
                                              : AppColorTheme.defaultWhite);
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              controller.removeToken();
                              homeController.currentNavPage.value = 0;
                            },
                            child: Text(
                              'Logout',
                              style: Get.textTheme.headlineLarge!
                                  .copyWith(color: defaultWhite),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColorTheme.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // RoundedStackContainer(controller: controller),
          AnimatedProfileImage(profileController: controller),
        ],
      ),
    );
  }
}

class RoundedStackContainer extends StatelessWidget {
  const RoundedStackContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: max(defaultStackTop - controller.scrollOffset.value, 0),
        child: AnimatedOpacity(
          duration: 300.milliseconds,
          opacity:
              (defaultStackTop - controller.scrollOffset.value <= 56) ? 0 : 1,
          child: Container(
            height: 20,
            width: Get.width,
            decoration: BoxDecoration(
                color: defaultWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
        ),
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
            color: defaultWhite,
            border: Border.all(
              color: defaultWhite,
              width: 3,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(diameter)),
            child: Image.asset(
              'assets/image/face.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
