import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/product/view.dart';
import 'package:ecommerce/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

import '../core/router/router.dart';
import '../views/product/products_model.dart';
import 'app_text.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  static bool sale = true;

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.navigateTo(
          ProductView(product: product),
        );
      },
      child: SizedBox(
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
                    child: FadeInImage.assetNetwork(
                      image: product.image!,
                      placeholder: 'assets/images/loading2.gif',
                      height: 184,
                      width: 148,
                      fit: BoxFit.fill,
                    ),
                  ),
                  product.discount != 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8, left: 9),
                          child: Container(
                            width: 40,
                            height: 24,
                            decoration: BoxDecoration(
                                color: primaryAppColor,
                                borderRadius: BorderRadius.circular(29)),
                            child: Align(
                                child: AppText(
                              text: '-${product.discount}%',
                              fontSize: 11,
                              color: white,
                            )),
                          ),
                        )
                      : const SizedBox(),
                  Positioned(
                      top: 164,
                      left: 112,
                      child: FavoriteButton(
                        product: product,
                      )),
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
              text: 'Amazon',
              fontSize: 11,
              color: grey,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: product.name ?? "",
              fontSize: 16,
              color: black,
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                product.discount != 0
                    ? AppText(
                        text: '${product.oldPrice}\$',
                        fontSize: 14,
                        color: grey,
                        decoration: TextDecoration.lineThrough,
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 4,
                ),
                AppText(
                  text: '${product.price}\$',
                  fontSize: 14,
                  color: primaryAppColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
