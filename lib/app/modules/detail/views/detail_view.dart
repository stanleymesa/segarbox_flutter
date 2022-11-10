import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite, navBarColor: defaultWhite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Detail',
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              child: Icon(
                Icons.shopping_cart_rounded,
                color: green,
              ),
              onTap: () => Get.toNamed(Routes.CART),
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          homeController.setSystemBar();
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children: [
                GestureDetector(
                  child: Hero(
                    tag: 'detail_image',
                    child: Image.asset(
                      'assets/image/veggie.jpg',
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () => Get.to(
                    DetailImage(
                      image: 'assets/image/veggie.jpg',
                      imageTitle:
                          'Broccoli Super Umami Biggest Broccoli in the World',
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Broccoli Super Umami Biggest Broccoli in the World',
                              style: title,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '1000 g',
                              style: normalDark,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Rp 8.000',
                              style: title,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Stock: 93',
                            style: normalDark.copyWith(color: green),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                style: title,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    lorem(),
                    style: normalDark,
                  ),
                ),
                SizedBox(
                  height: 102,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                width: Get.width,
                color: defaultWhite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add To Cart',
                      style: title.copyWith(color: defaultWhite),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailImage extends StatelessWidget {
  const DetailImage({
    required this.image,
    required this.imageTitle,
    super.key,
  });

  final String image;
  final String imageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          imageTitle,
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      body: Center(
        child: Hero(
          tag: 'detail_image',
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: defaultWhite),
            imageProvider: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
