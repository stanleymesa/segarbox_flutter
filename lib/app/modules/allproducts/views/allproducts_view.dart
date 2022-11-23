import 'dart:ffi';

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
      body: PagedListView<int, User>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<User>(
          itemBuilder: (context, item, index) => Column(
            children: [
              SizedBox(
                height: 36,
              ),
              Text(
                item.firstName!,
                style: title,
              ),
              SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
