import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/cart/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'cart_item.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: const Duration(seconds: 5),
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: Container(
        margin: const EdgeInsets.only(top: 18),
        decoration: BoxDecoration(
          color: error,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          Icons.delete_rounded,
          color: Colors.white,
          size: 50.0,
        ),
      ),
      onDismissed: (direction) {
        CartCubit.of(context)
            .toggleAddToCart(CartCubit.of(context).cartItems![index].id!);
        CartCubit.of(context)
                .cartID
                .contains(CartCubit.of(context).cartItems![index].id)
            ? CartCubit.of(context)
                .cartItems!
                .remove(CartCubit.of(context).cartItems![index])
            : CartCubit.of(context)
                .cartID
                .add(CartCubit.of(context).cartItems![index].id!);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: CartItem(
          product: CartCubit.of(context).cartItems![index],
        ),
      ),
    ).animate().effect().scale().move();
  }
}
