import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/rating_bar.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://i.pinimg.com/564x/8c/8e/cb/8c8ecbf422f590259832b5ececfdda1d.jpg',
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 280,
                  width: 340,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 25)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          text: 'Helene Moore',
                          fontSize: 14,
                          color: black,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const StarRatingBar(),
                        const SizedBox(
                          height: 12,
                        ),
                        const Opacity(
                          opacity: 0.8,
                          child: AppText(
                            text:
                                'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                            maxLines: 9,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const AppText(
                              text: 'Helpful',
                              color: grey,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.thumb_up_alt_rounded,
                                color: grey,
                                size: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
