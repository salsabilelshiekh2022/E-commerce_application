import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import 'units/rating_section.dart';
import 'units/review_list.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 128,
        height: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: primaryAppColor),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: white,
              size: 16,
            ),
            SizedBox(
              width: 3,
            ),
            AppText(
              text: 'Write a review',
              fontSize: 12,
              color: white,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const AppText(
          text: 'Rating and reviews',
          fontSize: 18,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                RatingSection(),
                SizedBox(
                  height: 33,
                ),
                AppText(
                  text: '8 reviews',
                  fontSize: 24,
                  color: black,
                ),
                SizedBox(
                  height: 28,
                ),
                ReviewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
