import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Detail',
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: green,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          homeController.setSystemBar();
          return true;
        },
        child: Center(
          child: Text(
            'DetailView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
