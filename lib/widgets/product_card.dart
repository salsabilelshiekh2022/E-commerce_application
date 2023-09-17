import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_text.dart';
import 'rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    return Column(
      children: [
        Container(
          width: width,
          height: height * .123,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image.network(
                'https://i.pinimg.com/564x/8c/8e/cb/8c8ecbf422f590259832b5ececfdda1d.jpg',
                width: width * 0.28,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 14,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text: 'LIME',
                            color: grey,
                            fontSize: 11,
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.close_rounded,
                              color: grey,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const AppText(
                        text: 'Shirt',
                        fontSize: 16,
                        color: black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Color: ',
                          style: TextStyle(color: grey, fontSize: 11),
                          children: [
                            TextSpan(
                              text: 'Blue',
                              style: TextStyle(color: black, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        children: [
                          AppText(
                            text: '32\$',
                            fontSize: 14,
                            color: black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StarRatingBar(),
                          AppText(
                            text: '(10)',
                            fontSize: 11,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: 45,
                    left: 163,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: primaryAppColor,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          color: white,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
