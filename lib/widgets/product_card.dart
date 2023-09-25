import 'package:ecommerce/core/assets/app_assets.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:flutter/material.dart';
import '../views/product/products_model.dart';

import '../constants.dart';
import '../views/product/view.dart';
import 'app_text.dart';
import 'rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    return GestureDetector(
        onTap: () {
          AppRouter.navigateTo(
            ProductView(product: product),
          );
        },
        child: Container(
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
              child: product.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: AppAssets.loading,
                      image: product.image!,
                      width: width * 0.28,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.loading,
                      width: width * 0.28,
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
                            text: 'Amazon',
                            color: grey,
                            fontSize: 11,
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          GestureDetector(
                            onTap: () {
                              FavoriteCubit.of(context)
                                  .toggleFavorite(product.id!);
                            },
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
                      AppText(
                        text: product.name!.substring(0, 10),
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
                      Row(
                        children: [
                          AppText(
                            text: '${product.price!.toInt()}\$',
                            fontSize: 14,
                            color: black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const StarRatingBar(),
                          const AppText(
                            text: '(10)',
                            fontSize: 11,
                            color: grey,
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: 45,
                    left: 180,
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
        ));
  }
}
