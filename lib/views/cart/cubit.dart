import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product/products_model.dart';

import '../../constants.dart';
import '../../core/api_services/api_services.dart';

part 'state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductModel>? cartItems;
  Set<int> cartID = {};
  double totalCost = 0;

  static CartCubit of(context) => BlocProvider.of(context);

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final response = await ApiService(Dio()).get(url: 'carts', token: token);

      List<dynamic> cartList = response.data['data']['cart_items'];
      totalCost = response.data['data']['total'];
      print(totalCost);
      cartItems = [];
      for (var item in cartList) {
        cartItems!.add(ProductModel.fromJson(item['product']));
        cartID.add(item['product']['id']);
      }
      emit(GetCartItems());
    } catch (e) {
      debugPrint(e.toString());
    }
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
  }
}
