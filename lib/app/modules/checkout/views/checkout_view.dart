import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite,
        title: Text(
          'Checkout',
          style:
              Get.textTheme.headlineLarge!.copyWith(color: AppColorTheme.green),
        ),
        iconTheme: IconThemeData(color: AppColorTheme.green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Delivery Address',
                  style: Get.textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Jl Pandansari Raya No 00, Semarang Tengah, Jawa Tengah, Indonesia',
                  style: Get.textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ADDRESS);
                  },
                  child: Text(
                    'Choose Address',
                    style: Get.textTheme.headline1!.copyWith(
                        color: AppColorTheme.defaultWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorTheme.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Checkout Items',
                  style: Get.textTheme.headlineLarge,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                          Row(
                            children: [
                              Text(
                                'Rp 20.000',
                                style: Get.textTheme.headline1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'X',
                                style: Get.textTheme.headline1!
                                    .copyWith(color: AppColorTheme.green),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '2',
                                style: Get.textTheme.headline1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Method',
                          style: Get.textTheme.headlineLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              'Choose',
                              style: Get.textTheme.headline1!
                                  .copyWith(color: AppColorTheme.green),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColorTheme.green,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  'assets/image/jne.jpg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'JNE',
                                  style: Get.textTheme.headline1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'REG',
                                  style: Get.textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '1 - 2 Hari',
                                  style: Get.textTheme.headline1,
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          'Rp 19.000',
                          style: Get.textTheme.headline1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Payment Details',
                  style: Get.textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Get.isDarkMode
                              ? AppColorTheme.defaultWhite
                              : AppColorTheme.defaultBlack,
                          width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Sub Total',
                            style: Get.textTheme.headline1,
                          ),
                          Text(
                            'Rp 49.000',
                            style: Get.textTheme.headline1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Cost',
                            style: Get.textTheme.headline1,
                          ),
                          Text(
                            'Rp 19.000',
                            style: Get.textTheme.headline1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price',
                            style: Get.textTheme.headline1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp 68.000',
                            style: Get.textTheme.headline1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
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
                        'Rp 68.000',
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.INVOICE);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorTheme.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(
                      'Make Order',
                      style: Get.textTheme.headline1!.copyWith(
                          color: AppColorTheme.defaultWhite,
                          fontWeight: FontWeight.bold),
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
