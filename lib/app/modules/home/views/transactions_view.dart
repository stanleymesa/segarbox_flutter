import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/transactions_controller.dart';
import 'package:segarbox_flutter/app/modules/home/views/home_view.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

class TransactionsPage extends GetView<TransactionsController> {
  const TransactionsPage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite, navBarColor: defaultWhite);
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
                  style: title.copyWith(color: green),
                ),
                backgroundColor: defaultWhite,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: green,
                    ),
                  )
                ],
                titleSpacing: 24,
                bottom: TabBar(
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: normalDark.copyWith(fontSize: 16),
                  labelColor: green,
                  labelStyle: normalDark.copyWith(fontSize: 16),
                  indicatorColor: green,
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
                  ListView.separated(
                    itemBuilder: (context, index) => Container(
                      color: Colors.grey,
                      height: 100,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) => Container(
                      color: Colors.amber,
                      height: 100,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
