import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/views/profile_view.dart';
import 'package:segarbox_flutter/app/modules/home/views/transactions_view.dart';
import 'package:segarbox_flutter/app/routes/app_pages.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => <Widget>[
            HomePage(controller: controller),
            TransactionsPage(homeController: controller),
            ProfilePage(homeController: controller),
          ].elementAt(controller.currentNavPage.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_rounded),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: Get.textTheme.bodyText1,
          unselectedLabelStyle: Get.textTheme.bodyText1,
          selectedItemColor: AppColorTheme.green,
          currentIndex: controller.currentNavPage.value,
          onTap: (index) async {
            if (index != 0) {
              (await controller.getToken() != '')
                  ? controller.currentNavPage.value = index
                  : Get.toNamed(Routes.LOGIN);
            } else {
              controller.currentNavPage.value = index;
            }
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    controller.resetHomeAppBar();
    return Stack(
      children: [
        NestedScrollView(
          controller: controller.scrollC,
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            Header(),
          ],
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Carousel(controller: controller),
              SizedBox(
                height: 16,
              ),
              CarouselIndicator(controller: controller),
              SizedBox(
                height: 24,
              ),
              MainChips(controller: controller),
              SizedBox(
                height: 16,
              ),
              HorizontalListView1(controller: controller),
              SizedBox(
                height: 16,
              ),
              AllProductsTitle(controller: controller),
              SizedBox(
                height: 16,
              ),
              GridView1(
                controller: controller,
              ),
              SizedBox(
                height: 64,
              )
            ],
          ),
        ),
        MainAppBar(controller: controller),
      ],
    );
  }
}

class GridView1 extends StatelessWidget {
  const GridView1({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: MasonryGridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Stack(
          children: [
            Card(
              color: Get.theme.cardColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 16),
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
                            child: Image.asset(
                              'assets/image/veggie.jpg',
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        controller.listTitle[index],
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '500 g',
                        style: Get.textTheme.headline1,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Rp 20.000',
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
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
                    splashColor: AppColorTheme.green.withOpacity(0.2),
                    onTap: () => Get.toNamed(Routes.DETAIL)!
                        .then((_) async => controller.setSystemBar()),
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

class AllProductsTitle extends StatelessWidget {
  const AllProductsTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Products',
            style: Get.textTheme.headlineLarge,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.ALLPRODUCTS)!
                .then((value) => controller.setSystemBar()),
            child: Row(
              children: [
                Text(
                  'See All',
                  style: Get.textTheme.headline1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.double_arrow_rounded,
                  color: AppColorTheme.green,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListView1 extends StatelessWidget {
  const HorizontalListView1({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285,
      child: controller.obx(
        (userResponse) => ListView.separated(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => (index !=
                    userResponse.data!.length)
                ? Stack(
                    children: [
                      Card(
                        color: Get.theme.cardColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SizedBox(
                          width: 150,
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
                                        userResponse.data![index].avatar
                                            .toString(),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  '${userResponse.data![index].firstName} ${userResponse.data![index].lastName}',
                                  style: Get.textTheme.headline1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  '500 g',
                                  style: Get.textTheme.headline1,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Rp 20.000',
                                  style: Get.textTheme.headline1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            splashColor: AppColorTheme.green.withOpacity(0.2),
                            onTap: () => Get.toNamed(Routes.DETAIL)!
                                .then((value) => controller.setSystemBar()),
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'See All',
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.double_arrow_rounded,
                        color: AppColorTheme.green,
                        size: 20,
                      )
                    ],
                  ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 16,
                ),
            itemCount: userResponse!.data!.length + 1),
        onLoading: Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: defaultWhite,
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Card(
              color: Get.theme.cardColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(
                width: 150,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 16,
            ),
            itemCount: 5,
          ),
        ),
        onEmpty: Text('Empty'),
        onError: (error) => Text(error.toString()),
      ),
    );
  }
}

class MainChips extends StatelessWidget {
  const MainChips({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        children: List.generate(
          controller.chips.length,
          (index) => Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                selectedColor: AppColorTheme.green.withOpacity(0.4),
                elevation: 2,
                label: Text(
                  controller.chips[index],
                  style: Get.textTheme.bodyText1,
                ),
                selected: (controller.chipsIndex.value == index) ? true : false,
                onSelected: (isSelected) {
                  if (isSelected) controller.chipsIndex.value = index;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.carouselImages.length,
        (index) => Obx(
          () => AnimatedContainer(
            duration: 300.milliseconds,
            margin: EdgeInsets.only(right: 4),
            width: (controller.carouselIndex.value == index) ? 32 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: (controller.carouselIndex.value == index)
                  ? AppColorTheme.green
                  : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) =>
            controller.carouselIndex.value = index,
        viewportFraction: 0.9,
        height: 132,
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.asset(
          controller.carouselImages[index],
          width: Get.width - 52,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: appBarHeight,
        width: Get.width,
        color: Get.isDarkMode
            ? AppColorTheme.defaultBlack.withOpacity(
                (controller.ratio.value <= 1.0) ? controller.ratio.value : 1.0)
            : AppColorTheme.defaultWhite.withOpacity(
                (controller.ratio.value <= 1.0) ? controller.ratio.value : 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: (controller.ratio.value <= 0.5)
                      ? defaultWhite
                      : AppColorTheme.green,
                  style: (controller.ratio.value <= 0.5)
                      ? normalLight
                      : normalDark.copyWith(color: AppColorTheme.green),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: (controller.ratio.value <= 0.5)
                        ? normalLight
                        : normalDark.copyWith(color: AppColorTheme.green),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: (controller.ratio.value <= 0.5)
                          ? defaultWhite
                          : AppColorTheme.green,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: (controller.ratio.value <= 0.5)
                              ? defaultWhite
                              : AppColorTheme.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: (controller.ratio.value <= 0.5)
                              ? defaultWhite
                              : AppColorTheme.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: (controller.ratio.value <= 0.5)
                      ? defaultWhite
                      : AppColorTheme.green,
                ),
                onTap: () => Get.toNamed(Routes.CART)!
                    .then((value) => controller.setSystemBar()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: headerHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: AppColorTheme.green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
        ),
      ),
    );
  }
}
