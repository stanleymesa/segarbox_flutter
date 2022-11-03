import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/views/profile_view.dart';
import 'package:segarbox_flutter/app/modules/home/views/transactions_view.dart';
import 'package:segarbox_flutter/theme/theme.dart';
import 'package:segarbox_flutter/utils/const.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => <Widget>[
            HomePage(controller: controller),
            TransactionsPage(),
            ProfilePage(),
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
          selectedLabelStyle: normalDark.copyWith(fontSize: 12),
          unselectedLabelStyle: normalDark.copyWith(fontSize: 12),
          selectedItemColor: green,
          currentIndex: controller.currentNavPage.value,
          onTap: (index) => controller.currentNavPage.value = index,
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
              HorizontalListView1(),
              SizedBox(
                height: 16,
              ),
              AllProductsTitle(),
              SizedBox(
                height: 16,
              ),
              GridView1(),
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
  const GridView1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) => Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class AllProductsTitle extends StatelessWidget {
  const AllProductsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Products',
            style: title,
          ),
          Row(
            children: [
              Text(
                'See All',
                style: normalBold,
              ),
              Icon(
                Icons.double_arrow_rounded,
                color: green,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HorizontalListView1 extends StatelessWidget {
  const HorizontalListView1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: ListView.separated(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => (index != 10)
              ? Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/image/veggie.jpg',
                            width: 150,
                            height: 125,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Broccoli Super Extra Umami Damn So Much',
                            style: normalBold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'See All',
                      style: normalBold,
                    ),
                    Icon(
                      Icons.double_arrow_rounded,
                      color: green,
                      size: 20,
                    )
                  ],
                ),
          separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
          itemCount: 10 + 1),
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
                selectedColor: green.withOpacity(0.4),
                elevation: 2,
                label: Text(
                  controller.chips[index],
                  style: normalDark.copyWith(fontSize: 12),
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
                  ? green
                  : green.withOpacity(0.4),
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
          color: defaultWhite.withOpacity(
              (controller.ratio.value <= 1.0) ? controller.ratio.value : 1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor:
                        (controller.ratio.value <= 0.5) ? defaultWhite : black,
                    style: (controller.ratio.value <= 0.5)
                        ? normalLight
                        : normalDark,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: (controller.ratio.value <= 0.5)
                          ? normalLight
                          : normalDark,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18,
                        color: (controller.ratio.value <= 0.5)
                            ? defaultWhite
                            : black,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (controller.ratio.value <= 0.5)
                                ? defaultWhite
                                : black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (controller.ratio.value <= 0.5)
                                ? defaultWhite
                                : black),
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
                Icon(
                  Icons.shopping_cart_rounded,
                  color: (controller.ratio.value <= 0.5) ? defaultWhite : black,
                )
              ],
            ),
          )),
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
            color: green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
        ),
      ),
    );
  }
}
