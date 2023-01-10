import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/transactions_controller.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';

class TransactionsPage extends GetView<TransactionsController> {
  const TransactionsPage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    controller.setSystemBar();
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async {
          homeController.currentNavPage.value = 0;
          return false;
        },
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: AppBar(
                title: Text(
                  'Transactions',
                  style: Get.textTheme.headlineLarge!
                      .copyWith(color: AppColorTheme.green),
                ),
                backgroundColor: Get.isDarkMode
                    ? AppColorTheme.defaultBlack
                    : AppColorTheme.defaultWhite,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: AppColorTheme.green,
                    ),
                  )
                ],
                titleSpacing: 24,
                bottom: TabBar(
                  unselectedLabelColor: Get.isDarkMode
                      ? AppColorTheme.defaultWhite
                      : AppColorTheme.defaultBlack,
                  unselectedLabelStyle: Get.textTheme.headline1,
                  labelColor: AppColorTheme.green,
                  labelStyle: Get.textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                  indicatorColor: AppColorTheme.green,
                  tabs: [
                    Tab(
                      child: Text(
                        'In Progress',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'History',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InProgress(),
                  History(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/image/veggie.jpg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
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
                      '18 Jun 2022',
                      style: Get.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '2 Items',
                      style: Get.textTheme.headline1,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grand Total',
                      style: Get.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rp 120.000',
                      style: Get.textTheme.headline1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        thickness: 4,
      ),
      itemCount: 10,
    );
  }
}

class InProgress extends StatelessWidget {
  const InProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/image/veggie.jpg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
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
                      '18 Jun 2022',
                      style: Get.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '2 Items',
                      style: Get.textTheme.headline1,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '+ 2 more products',
              style: Get.textTheme.headline1,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grand Total',
                      style: Get.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rp 120.000',
                      style: Get.textTheme.headline1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Check Status'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorTheme.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                )
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        thickness: 4,
      ),
      itemCount: 10,
    );
  }
}
