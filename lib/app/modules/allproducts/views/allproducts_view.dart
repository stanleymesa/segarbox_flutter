import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:segarbox_flutter/app/data/models/user.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

import '../controllers/allproducts_controller.dart';

class AllproductsView extends GetView<AllproductsController> {
  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        toolbarHeight: appBarHeight,
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 24, 0),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: green,
            ),
          ),
        ],
        title: SizedBox(
          child: TextField(
            cursorColor: green,
            style: normalDark.copyWith(color: green),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: normalDark.copyWith(color: green),
              prefixIcon: Icon(
                Icons.search,
                size: 18,
                color: green,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: green),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: green),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
      body: PagedGridView<int, User>(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        pagingController: controller.pagingController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.61,
        ),
        builderDelegate: PagedChildBuilderDelegate<User>(
          itemBuilder: (context, item, index) => Stack(
            children: [
              Card(
                color: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                item.avatar.toString(),
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${item.firstName} ${item.lastName}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: normalBold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '500 g',
                          style: normalDark,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Rp 20.000',
                          style: normalBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: SizedBox(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      splashColor: green.withOpacity(0.2),
                      onTap: () => Get.toNamed(Routes.DETAIL),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
