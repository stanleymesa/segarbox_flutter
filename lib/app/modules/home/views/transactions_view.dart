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
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                    style: normalBold,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '18 Jun 2022',
                                    style: normalDark,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: normalDark,
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
                            style: normalDark,
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
                                    style: normalDark,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Rp 120.000',
                                    style: normalBold,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Check Status'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
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
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
