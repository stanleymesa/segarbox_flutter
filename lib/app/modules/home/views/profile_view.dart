import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/profile_controller.dart';
import 'package:segarbox_flutter/theme/theme.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        homeController.currentNavPage.value = 0;
        return false;
      },
      child: Container(
        color: green,
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
