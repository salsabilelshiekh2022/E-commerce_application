import 'package:dio/dio.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/favorite/favorite_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';

part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  late FavoriteModel favoriteModel;

  late List<Datum>? favorites = [];
  Set<int> favoritsID = {};

  static FavoriteCubit of(context) => BlocProvider.of(context);

  Future<void> getFavorits() async {
    try {
      final response =
          await ApiService(Dio()).get(url: 'favorites', token: token);
      //debugPrint(response.data.toString());

      favoriteModel = FavoriteModel.fromJson(response.data);
      favorites = favoriteModel.data?.data?.map((e) => e).toList();
      for (var item in favorites!) {
        favoritsID.add(item.product!.id!);
      }
      emit(GetFavorites());
    } catch (e) {
      debugPrint('error');
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
        await getFavorits();
        emit(RemoveFromFavorite());
      } else {
        favoritsID.add(id);
        getFavorits();
        // debugPrint('add');
        emit(AddToFavorite());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(FavoriteInitial());
  }
}
