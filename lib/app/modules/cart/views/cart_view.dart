import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.setSystemBar();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite,
        title: Text(
          'My Cart',
          style:
              Get.textTheme.headlineLarge!.copyWith(color: AppColorTheme.green),
        ),
        iconTheme: IconThemeData(color: AppColorTheme.green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(top: 16, bottom: 96),
            itemCount: 10,
            separatorBuilder: (context, index) => Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: true,
                          activeColor: AppColorTheme.green,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(
                            'assets/image/veggie.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Broccoli',
                              style: Get.textTheme.headline1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '1000 g',
                              style: Get.textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Rp 20.000',
                              style: Get.textTheme.headline1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Material(
                          child: InkWell(
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: AppColorTheme.green,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '13',
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Material(
                          child: InkWell(
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color: AppColorTheme.green,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              width: Get.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? AppColorTheme.defaultBlack
                    : AppColorTheme.defaultWhite,
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode ? Colors.white12 : Colors.black12,
                    blurRadius: 24,
                    offset: Offset(0, -2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: Get.textTheme.headline1,
                      ),
                      Text(
                        'Rp 240.000',
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.CHECKOUT);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorTheme.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(
                      'Checkout',
                      style: Get.textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.defaultWhite),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
