import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/rating_bar.dart';
import 'rating_line.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: '4.3',
              fontSize: 34,
              color: black,
            ),
            SizedBox(
              height: 16,
            ),
            AppText(
              text: '23 ratings',
              color: grey,
              fontSize: 14,
            )
          ],
        ),
        SizedBox(
          width: 28,
        ),
        Column(
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
          width: 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingLine(width: 114),
            SizedBox(
              height: 14,
            ),
            RatingLine(width: 40),
            SizedBox(
              height: 14,
            ),
            RatingLine(width: 29),
            SizedBox(
              height: 14,
            ),
            RatingLine(width: 15),
            SizedBox(
              height: 14,
            ),
            RatingLine(width: 8)
          ],
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          children: [
            AppText(
              text: '12',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8,
            ),
            AppText(
              text: '5',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8,
            ),
            AppText(
              text: '4',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8,
            ),
            AppText(
              text: '2',
              color: grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 8,
            ),
            AppText(
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
