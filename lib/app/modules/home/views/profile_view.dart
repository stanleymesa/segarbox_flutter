import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/profile_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (diameter / 2) + 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Agus Surmono Pakiyem Tuminah',
                        style: title,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'agussumono@gmail.com',
                        style: normalDark.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: black,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Cart',
                            style: normalBold,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: green,
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
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.RATING)!
                          .then((_) async => setStatusBarColor()),
                      child: Container(
                        color: defaultWhite,
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
                                    style: normalBold,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: green,
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
                            style: normalBold,
                          ),
                          SizedBox(
                            width: 50,
                            height: 20,
                            child: Obx(
                              () => Switch(
                                value: controller.isDarkMode.value,
                                activeColor: green,
                                activeTrackColor: Color(0x52000000),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (_) =>
                                    controller.isDarkMode.toggle(),
                              ),
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
                          onPressed: () {},
                          child: Text(
                            'Logout',
                            style: title.copyWith(color: defaultWhite),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                        ),
                      ),
                    ),
                  ],
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
