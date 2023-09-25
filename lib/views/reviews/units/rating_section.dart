import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/rating_bar.dart';
import 'rating_line.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: '4.3',
              fontSize: 34.sp,
              color: black,
            ),
            SizedBox(
              height: 16.h,
            ),
            const AppText(
              text: '23 ratings',
              color: grey,
              fontSize: 14,
            )
          ],
        ),
        SizedBox(
          width: 28.w,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StarRatingBar(),
            SizedBox(
              height: 7,
            ),
            StarRatingBar(
              itemCount: 4,
            ),
            SizedBox(
              height: 7,
            ),
            StarRatingBar(
              itemCount: 3,
            ),
            SizedBox(
              height: 7,
            ),
            StarRatingBar(
              itemCount: 2,
            ),
            SizedBox(
              height: 7,
            ),
            StarRatingBar(
              itemCount: 1,
            ),
          ],
        ),
        SizedBox(
          width: 3.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingLine(width: 114.w),
            SizedBox(
              height: 14.h,
            ),
            RatingLine(width: 40.w),
            SizedBox(
              height: 14.h,
            ),
            RatingLine(width: 29.w),
            SizedBox(
              height: 14.h,
            ),
            RatingLine(width: 15.w),
            SizedBox(
              height: 14.h,
            ),
            RatingLine(width: 8.w)
          ],
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          children: [
            const AppText(
              text: '12',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8.h,
            ),
            const AppText(
              text: '5',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8.h,
            ),
            const AppText(
              text: '4',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8.h,
            ),
            const AppText(
              text: '2',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8.h,
            ),
            const AppText(
              text: '0',
              color: grey,
              fontSize: 14,
            ),
          ],
        )
      ],
    );
  }
}
