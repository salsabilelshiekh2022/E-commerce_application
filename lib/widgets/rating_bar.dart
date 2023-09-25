import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingBar extends StatelessWidget {
  const StarRatingBar({super.key, this.itemCount});
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: itemCount ?? 5,
      itemSize: 14.sp,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: yellow,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
