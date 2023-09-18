import 'package:ecommerce/views/cart/cart_model.dart' as cart;
import 'package:ecommerce/views/cart/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final cart.CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);
    return Container(
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
              cartItem.product!.image!,
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
                  text: cartItem.product!.name!.substring(0, 10),
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
                    Container(
                      width: 36,
                      height: 36,
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
                    const SizedBox(
                      width: 16,
                    ),
                    AppText(
                      text: '${cartItem.quantity!}',
                      fontSize: 14,
                      color: black,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 36,
                      height: 36,
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
                    const SizedBox(
                      width: 40,
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return AppText(
                          text: '${cartItem.product!.price!.toInt()}\$',
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
    );
  }
}
