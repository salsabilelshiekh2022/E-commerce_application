import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:ecommerce/widgets/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../widgets/check_connection.dart';
import '../../widgets/product_card.dart';
import 'units/filter_bar.dart';
import 'units/list_of_items.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FavoriteCubit.of(context);

    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return BlocBuilder(
              bloc: cubit,
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
                  body: cubit.favorites!.isNotEmpty
                      ? SafeArea(
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
                                    itemCount: cubit.favorites!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const EmptyData(),
                );
              });
        } else {
          return const CheckConnection();
        }
      },
      child: const SizedBox(),
    );
  }
}
