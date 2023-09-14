import 'package:ecommerce/constants.dart';
import 'package:ecommerce/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

import '../core/assets/app_assets.dart';
import 'app_text.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  static bool sale = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppAssets.headerAsset,
                    height: 184,
                    width: 148,
                    fit: BoxFit.cover,
                  ),
                ),
                sale
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8, left: 9),
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                              color: primaryAppColor,
                              borderRadius: BorderRadius.circular(29)),
                          child: const Align(
                            child: AppText(
                              text: '-20% ',
                              fontSize: 11,
                              color: white,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const FavoriteButton(),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: StarRatingBar(),
          ),
          const SizedBox(
            height: 6,
          ),
          const AppText(
            text: 'Dorothy Perkins',
            fontSize: 11,
            color: grey,
          ),
          const SizedBox(
            height: 5,
          ),
          const AppText(
            text: 'Evening Dress',
            fontSize: 16,
            color: black,
          ),
          const SizedBox(
            height: 3,
          ),
          const Row(
            children: [
              AppText(
                text: '15\$',
                fontSize: 14,
                color: grey,
                decoration: TextDecoration.lineThrough,
              ),
              SizedBox(
                width: 4,
              ),
              AppText(
                text: '12\$',
                fontSize: 14,
                color: primaryAppColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
