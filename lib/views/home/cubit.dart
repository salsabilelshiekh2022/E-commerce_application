import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';
import '../product/products_model.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late ProductsModel productsModel;
  late List<Datum>? products;
  List<Datum> saleProducts = [];
  List<Datum> newProducts = [];

  static HomeCubit of(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final response = await ApiService(Dio()).get(url: 'products');
      // debugPrint(response.data.toString());
      productsModel = ProductsModel.fromJson(response.data);
      products = productsModel.data?.data?.map((e) => e).toList();

      for (var i = 0; i < products!.length; i++) {
        if (products![i].discount == 0) {
          newProducts.add(products![i]);
        } else {
          saleProducts.add(products![i]);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(HomeInitial());
  }
}
