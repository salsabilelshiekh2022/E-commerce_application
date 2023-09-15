import 'package:dio/dio.dart';
import 'package:ecommerce/views/home/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_services/api_services.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late HomeModel homeModel;
  static HomeCubit of(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final response = await ApiService(Dio()).get(url: 'home');
      // debugPrint(response.data.toString());
      homeModel = HomeModel.fromJson(response.data);
      debugPrint('ssssssssssssss');
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(HomeInitial());
  }
}
