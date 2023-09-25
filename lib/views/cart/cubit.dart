import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product/products_model.dart';

import '../../constants.dart';
import '../../core/api_services/api_services.dart';

part 'state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  late List<ProductModel>? cartItems = [];
  Set<int> cartID = {};
  dynamic totalCost = 0;

  static CartCubit of(context) => BlocProvider.of(context);

  Future<void> getCartItems() async {
    try {
      final response = await ApiService(Dio()).get(url: 'carts', token: token);
      cartItems = [];

      List<dynamic> cartList = response.data['data']['cart_items'];
      totalCost = response.data['data']['total'];

      for (var item in cartList) {
        cartItems!.add(ProductModel.fromJson(item['product']));
        cartID.add(item['product']['id']);
      }
      emit(GetCartItems());
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(CartInitial());
  }

  Future<dynamic> toggleAddToCart(int id) async {
    emit(CartLoading());
    try {
      await ApiService(Dio())
          .post(data: {"product_id": id}, url: 'carts', token: token);

      if (cartID.contains(id)) {
        cartID.remove(id);
        //debugPrint('remove');
        //await getCartItems();
        emit(RemoveFromCart());
      } else {
        cartID.add(id);
        //getCartItems();
        //debugPrint('add');
        emit(AddToCart());
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    emit(CartInitial());
  }

  /*
  Future<dynamic> toggleFavorite(int id) async {
    try {
      await ApiService(Dio())
          .post(data: {"product_id": id}, url: 'favorites', token: token);

      if (favoritsID.contains(id)) {
        favoritsID.remove(id);
        //debugPrintprint('remove');
        //await getFavorits();
        emit(RemoveFromFavorite());
      } else {
        favoritsID.add(id);
        //getFavorits();
        // debugPrint('add');
        emit(AddToFavorite());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(FavoriteInitial());
  }
   */
}
