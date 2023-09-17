import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/product_card.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FavoriteCubit.of(context);
    return BlocBuilder(
        bloc: FavoriteCubit.of(context),
        builder: (context, state) {
          cubit.getFavorits();

          return Scaffold(
            appBar: AppBar(
                title: const AppText(
                  text: 'Favorites',
                  fontSize: 18,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ]),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const ListOfItems(),
                      const FilterBar(),
                      ListView.builder(
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCard(
                              product: cubit.favorites![index],
                            ),
                          );
                        }),
                        itemCount: FavoriteCubit.of(context).favorites!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          itemCount: itemsName.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: AppText(
                    text: itemsName[index],
                    color: white,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_list,
            size: 24,
            color: black,
          ),
        ),
        const AppText(
          text: 'Filters',
          fontSize: 11,
          color: black,
        ),
        const SizedBox(
          width: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.arrow_up_arrow_down,
            size: 18,
            color: black,
          ),
        ),
        const AppText(
          text: 'Price: lowest to high',
          fontSize: 11,
          color: black,
        ),
        const SizedBox(
          width: 15,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.grid_view_sharp,
            size: 18,
            color: black,
          ),
        ),
      ],
    );
  }
}

List<String> itemsName = [
  "electrionic",
  "Medical",
  "sports",
  "Lighting",
  "Clothes",
];
