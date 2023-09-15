import 'package:ecommerce/core/assets/app_assets.dart';
import 'package:ecommerce/views/home/cubit.dart';
import 'package:ecommerce/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../widgets/app_text.dart';
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
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            AppAssets.headerAsset,
                            width: double.infinity,
                            height: height * .32,
                            fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 26.0,
                            ),
                            child: AppText(
                              text: 'Street Clothes',
                              color: white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                              return const Padding(
                                padding: EdgeInsets.only(right: 17),
                                child: ProductItem(),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
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
                              return const Padding(
                                padding: EdgeInsets.only(right: 17),
                                child: ProductItem(),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
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
