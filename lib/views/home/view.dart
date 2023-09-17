import 'package:ecommerce/views/home/cubit.dart';
import 'package:ecommerce/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../widgets/header_of_list.dart';
import '../../widgets/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final cubit = HomeCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return state is HomeLoading
            ? const ShimmerLoading()
            : Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://i.pinimg.com/564x/9a/a6/64/9aa66492c28bd11917d5902f8c555b5f.jpg",
                        width: double.infinity,
                        height: height * .32,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const HeaderOfList(
                        title: 'Sale',
                        subTitle: 'Super Summer Sale',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 22),
                        child: SizedBox(
                          height: height * .334,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 17),
                                child: ProductItem(
                                    product: cubit.saleProducts[index]),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.saleProducts.length,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const HeaderOfList(
                        title: 'New',
                        subTitle: "You've never seen it before!",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 22),
                        child: SizedBox(
                          height: height * .334,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 17),
                                child: ProductItem(
                                    product: cubit.newProducts[index]),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.newProducts.length,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
