import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:ecommerce/views/product/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cubit = FavoriteCubit.of(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          cubit.favoritsID.contains(product.id!)
              ? cubit.favoritsID.remove(product.id!)
              : cubit.favoritsID.add(product.id!);
          cubit.toggleFavorite(product.id!);
        },
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 4), blurRadius: 4)
              ]),
          child: Icon(
            cubit.favoritsID.contains(product.id)
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color:
                cubit.favoritsID.contains(product.id) ? primaryAppColor : grey,
            size: 16,
          ),
        ),
      );
    });
  }
}
