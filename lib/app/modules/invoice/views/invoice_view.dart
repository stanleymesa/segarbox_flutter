import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Invoice',
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
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: black,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stanley Mesa',
                        style: normalBold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Jl. Pandansari Raya No 99, Kecamatan Semarang Tengah, Kota Semarang, Jawa Tengah 50139, Indonesia',
                        style: normalDark,
                      )
                    ],
                  ),
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
                    blurRadius: 12,
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
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName(Routes.HOME));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(
                      'Complete',
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
