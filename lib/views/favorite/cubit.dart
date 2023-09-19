import 'package:dio/dio.dart';
import 'package:ecommerce/constants.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';
import '../product/products_model.dart';

part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductModel>? favorites;
  Set<int> favoritsID = {};

  static FavoriteCubit of(context) => BlocProvider.of(context);

  Future<void> getFavorits() async {
    try {
      final response =
          await ApiService(Dio()).get(url: 'favorites', token: token);

      List<dynamic> favoriteList = response.data['data']['data'];
      favorites = [];

      for (var item in favoriteList) {
        favorites!.add(ProductModel.fromJson(item['product']));
        favoritsID.add(item['product']['id']);
      }

      emit(GetFavorites());
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(FavoriteInitial());
  }

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
}
