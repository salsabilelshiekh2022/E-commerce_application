import 'package:dio/dio.dart';
import 'package:ecommerce/views/cart/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/api_services/api_services.dart';

part 'state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  late CartModel cartModel;
  late List<CartItem>? cartItems = [];
  Set<int> cartID = {};

  static CartCubit of(context) => BlocProvider.of(context);

  Future<void> getCartItems() async {
    try {
      final response = await ApiService(Dio()).get(url: 'carts', token: token);

      cartModel = CartModel.fromJson(response.data);
      //debugPrint(response.data.toString());

      cartItems = cartModel.data?.cartItems?.map((e) => e).toList();
      for (var item in cartItems!) {
        cartID.add(item.product!.id!);
      }
      emit(GetCartItems());
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(CartInitial());
  }

  Future<dynamic> toggleAddToCart(int id) async {
    try {
      await ApiService(Dio())
          .post(data: {"product_id": id}, url: 'carts', token: token);

      if (cartID.contains(id)) {
        cartID.remove(id);
        //debugPrint('remove');
        await getCartItems();
        emit(RemoveFromCart());
      } else {
        cartID.add(id);
        getCartItems();
        //debugPrint('add');
        emit(AddToCart());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(CartInitial());
  }
}
