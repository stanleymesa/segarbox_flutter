import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode
              ? AppColorTheme.defaultBlack
              : AppColorTheme.defaultWhite,
          title: Text(
            'Address',
            style: Get.textTheme.headlineLarge!
                .copyWith(color: AppColorTheme.green),
          ),
          iconTheme: IconThemeData(color: AppColorTheme.green),
          titleSpacing: 0,
          elevation: 0.2,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.MAPS);
                },
                child: Text(
                  'Add Address',
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
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
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
                  itemBuilder: (context, index) => Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Jl Pandansari Raya No 00, Semarang Tengah, Jawa Tengah, Indonesia',
                              style: Get.textTheme.headline1,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ],
                      )),
            )
          ],
        ));
  }
}
