import 'package:ecommerce/views/cart/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../core/router/router.dart';
import '../../../widgets/app_alert.dart';
import '../../../widgets/app_text.dart';
import '../../product/products_model.dart';
import '../../product/view.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);
    return GestureDetector(
      onTap: () {
        AppRouter.navigateTo(
          ProductView(product: product),
        );
      },
      child: Container(
        width: width,
        height: height * 0.128,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image.network(
                product.image!,
                width: width * 0.28,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.53,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: grey,
                          size: 14,
                        ),
                      )
                    ],
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
                    height: 5,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AppAlert(
                                  id: product.id!,
                                );
                              });
                        },
                        child: Container(
                          width: 36.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ]),
                          child: const Icon(
                            Icons.remove_rounded,
                            color: grey,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const AppText(
                        text: '1', // ${cartItem.quantity!}',
                        fontSize: 14,
                        color: black,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                        child: const Icon(
                          Icons.add_rounded,
                          color: grey,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return AppText(
                            text: '${product.price!.toInt()}\$',
                            fontSize: 14,
                            color: black,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
