import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';
import '../product/products_model.dart';

part 'state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<ProductModel>? searchProducts = [];

  static SearchCubit of(context) => BlocProvider.of(context);

  Future<void> getSearchData(String text) async {
    emit(SearchLoading());
    try {
      final response = await ApiService(Dio()).post(data: {
        "text": text,
      }, url: 'products/search');
      //print('response done');

      List<dynamic> productList = response.data['data']['data'];

      //print(response.data);
      searchProducts = [];
      for (var item in productList) {
        searchProducts!.add(ProductModel.fromJson(item));
      }
      emit(GetSearchSuccessFully());
      //print(searchProducts!.length);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
