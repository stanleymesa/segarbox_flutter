import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Checkout',
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
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
                  style: title,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Jl Pandansari Raya No 00, Semarang Tengah, Jawa Tengah, Indonesia',
                  style: normalDark,
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
                    style: normalBold.copyWith(color: defaultWhite),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green,
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
                  style: title,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                primary: false,
                shrinkWrap: true,
                itemCount: 5,
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
                          Row(
                            children: [
                              Text(
                                'Rp 20.000',
                                style: normalBold,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'X',
                                style: normalBold.copyWith(color: green),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '2',
                                style: normalBold,
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
                          style: title,
                        ),
                        Row(
                          children: [
                            Text(
                              'Choose',
                              style: normalDark.copyWith(color: green),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: green,
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
                                  style: normalBold,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'REG',
                                  style: normalDark,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '1 - 2 Hari',
                                  style: normalDark,
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          'Rp 19.000',
                          style: normalBold,
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
                  style: title,
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
                      border: Border.all(color: black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Sub Total',
                            style: normalDark,
                          ),
                          Text(
                            'Rp 49.000',
                            style: normalDark,
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
                            style: normalDark,
                          ),
                          Text(
                            'Rp 19.000',
                            style: normalDark,
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
                            style: normalBold,
                          ),
                          Text(
                            'Rp 68.000',
                            style: normalBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 96,
              ),
            ],
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
                        'Rp 68.000',
                        style: normalBold,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(
                      'Make Order',
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
