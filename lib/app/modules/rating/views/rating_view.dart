import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/rating_controller.dart';

class RatingView extends GetView<RatingController> {
  @override
  Widget build(BuildContext context) {
    systemBarColor(statusBarColor: defaultWhite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Rating',
          style: title.copyWith(color: green),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: green,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
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
                            style: normalBold,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '18 Jun 2022',
                            style: normalDark,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RatingBar.builder(
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            initialRating: 5,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            onRatingUpdate: (value) {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
          itemCount: 10),
    );
  }
}
