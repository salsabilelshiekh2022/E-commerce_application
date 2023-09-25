import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:ecommerce/widgets/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/router/router.dart';
import '../../widgets/check_connection.dart';
import '../../widgets/product_card.dart';
import '../product/products_model.dart';
import '../product/view.dart';
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
                                  cubit.showGridView
                                      ? GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: GridItem(
                                                product:
                                                    cubit.favorites![index],
                                              ),
                                            );
                                          },
                                          itemCount: cubit.favorites!.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                        )
                                      : ListView.builder(
                                          itemBuilder: ((context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16),
                                              child: ProductCard(
                                                product:
                                                    cubit.favorites![index],
                                              )
                                                  .animate()
                                                  .effect()
                                                  .scale()
                                                  .move(),
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

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.product});

  //static bool sale = true;

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
        width: 164.w,
        height: 281.h,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                    image: product.image!,
                    placeholder: 'assets/images/loading2.gif',
                    height: 100.h,
                    width: 148.w,
                    fit: BoxFit.fill,
                  ),
                ),
                product.discount != 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8, left: 9),
                        child: Container(
                          width: 40.w,
                          height: 24.h,
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
                  top: 65.h,
                  left: 105.w,
                  child: Container(
                    width: 36.w,
                    height: 36.h,
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
              ]),
            ),
            const SizedBox(
              height: 3,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: 'Amazon',
                  fontSize: 11,
                  color: grey,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: '${product.name!.substring(0, 10)} ...',
                  fontSize: 14,
                  color: black,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: '${product.price}\$',
                  fontSize: 14,
                  color: black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
