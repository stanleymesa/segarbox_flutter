import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite, navBarColor: defaultWhite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'My Cart',
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
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
                          activeColor: green,
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
                              style: normalDark.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '1000 g',
                              style: smallDark,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Rp 20.000',
                              style: normalBold,
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
                              color: green,
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
                        style: normalBold,
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
                              color: green,
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
                color: defaultWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -1),
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
                        style: normalDark,
                      ),
                      Text(
                        'Rp 240.000',
                        style: normalBold,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.CHECKOUT);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(
                      'Checkout',
                      style: normalBold.copyWith(color: defaultWhite),
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
