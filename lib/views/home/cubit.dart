import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';
import '../product/products_model.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> products = [];
  List<ProductModel> saleProducts = [];
  List<ProductModel> newProducts = [];

  static HomeCubit of(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final response = await ApiService(Dio()).get(url: 'products');

      List<dynamic> productList = response.data['data']['data'];

      for (var item in productList) {
        products.add(ProductModel.fromJson(item));
      }

      for (var item in products) {
        if (item.discount == 0) {
          newProducts.add(item);
        } else {
          saleProducts.add(item);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(HomeInitial());
  }
}
