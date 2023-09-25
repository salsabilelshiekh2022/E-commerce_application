import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/cart/cubit.dart';
import 'package:ecommerce/views/cart/units/dimissible.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_text.dart';
import '../../widgets/check_connection.dart';
import '../../widgets/empty_data.dart';
import 'units/promo_code_field.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return BlocBuilder(
              bloc: CartCubit.of(context),
              builder: (context, state) {
                final cubit = CartCubit.of(context);
                cubit.getCartItems();
                return Scaffold(
                  appBar: AppBar(
                      title: const AppText(
                        text: 'My Bag',
                        fontSize: 18,
                      ),
                      centerTitle: true,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ]),
                  body: cubit.totalCost != 0
                      ? SafeArea(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    itemBuilder: (context, index) {
                                      return DismissibleWidget(
                                        index: index,
                                      );
                                    },
                                    itemCount: cubit.cartItems!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                  ),
                                  cubit.totalCost != 0
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: 25.h,
                                            ),
                                            const PromoCodeField(),
                                            const SizedBox(
                                              height: 28,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const AppText(
                                                  text: 'Total amount:',
                                                  fontSize: 14,
                                                  color: grey,
                                                ),
                                                AppText(
                                                  text:
                                                      '${cubit.totalCost.toInt()}\$',
                                                  fontSize: 18,
                                                  color: black,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 70.h,
                                            ),
                                            const AppButton(title: 'CHECK OUT'),
                                          ],
                                        )
                                      : const SizedBox(),
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
