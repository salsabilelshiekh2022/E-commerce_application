import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../views/cart/cubit.dart';

class AppAlert extends StatelessWidget {
  const AppAlert({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Delete Product ',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: primaryAppColor),
      ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
      content: const Text(
        textAlign: TextAlign.center,
        'Are you sure you want to delete this article?',
        style: TextStyle(color: black),
      ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 90,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('Cancled',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: primaryAppColor)),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                onTap: () {
                  CartCubit.of(context).toggleAddToCart(id);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 90,
                  height: 45,
                  decoration: BoxDecoration(
                      color: primaryAppColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('yes, delete',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )..animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
        )
      ],
    );
  }
}
