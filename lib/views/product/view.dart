import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/views/cart/cubit.dart';
import 'package:ecommerce/views/product/products_model.dart';
import 'package:ecommerce/views/reviews/view.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:ecommerce/widgets/favorite_button.dart';
import 'package:ecommerce/widgets/loading_button.dart';
import 'package:ecommerce/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_margin_widget/flutter_margin_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/rating_bar.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
        title: AppText(
          text: product.name!.substring(0, 13),
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.image!,
                    height: height * .5,
                    width: width.w,
                    fit: BoxFit.contain,
                  ).animate().fade(curve: Curves.easeInOut).scale().move(),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: FavoriteButton(
                            product: product,
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'Amazon',
                              fontSize: 24.sp,
                              color: black,
                            ),
                            AppText(
                              text: '\$${product.price}',
                              fontSize: 24.sp,
                              color: black,
                            ),
                          ],
                        ),
                        AppText(
                          text: product.name!.substring(0, 10),
                          fontSize: 11,
                          color: grey,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          children: [
                            StarRatingBar(),
                            AppText(
                              text: '(10)',
                              color: grey,
                              fontSize: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppText(
                          text: product.description!,
                          fontSize: 14.sp,
                          color: black,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          thickness: 0.4,
                          color: grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                text: 'Rating',
                                fontSize: 16,
                                color: black,
                              ),
                              InkWell(
                                onTap: () {
                                  AppRouter.navigateTo(const ReviewsView());
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: black,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 0.4,
                          color: grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'Support',
                                fontSize: 16,
                                color: black,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: black,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 0.4,
                          color: grey,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'You can also like this',
                              fontSize: 18,
                              color: black,
                            ),
                            AppText(
                              text: '12 items',
                              fontSize: 11,
                              color: grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 275.h,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 5,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: ProductItem(
                                    product: product,
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                ],
              ),
            ),
            Margin(
              margin: EdgeInsets.only(top: height * .764),
              child: Container(
                  height: height * .137,
                  width: width,
                  color: lightScaffoldBackgroundColor,
                  padding: EdgeInsets.only(
                      top: 20.h, bottom: 34.h, left: 16.w, right: 16.w),
                  child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                    if (state is CartLoading) {
                      return const LoadingButton();
                    } else if (CartCubit.of(context)
                        .cartID
                        .contains(product.id)) {
                      return AppButton(
                        title: 'Already in cart tap to remove ',
                        onTap: () {
                          CartCubit.of(context).toggleAddToCart(product.id!);
                        },
                      );
                    } else {
                      return AppButton(
                        title: 'Add to cart',
                        onTap: () {
                          CartCubit.of(context).toggleAddToCart(product.id!);
                        },
                      );
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
