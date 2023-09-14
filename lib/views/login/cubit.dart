import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/app_storage/app_storage.dart';
import 'package:ecommerce/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/models/user/user.dart';
import '../../widgets/snak_bar.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  User? user;

  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  static LoginCubit of(context) => BlocProvider.of(context);

  Future<void> login() async {
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        final response = await ApiService(Dio()).post(data: {
          "email": emailController.text,
          "password": passwordController.text
        }, url: 'login');
        user = User.fromJson(response.data);
        if (user!.status!) {
          //showSnakBar(user!.message!, success);

          await AppStorage.cacheUser(user!.data!.token!);
          navigatorKey.currentState!
              .pushNamedAndRemoveUntil(AppRoutes.navBarRoute, (_) => false);
        } else {
          showSnakBar(user!.message!, error);
        }
      } catch (e) {
        showSnakBar(user!.message!, error);
      }

      emit(LoginInitial());
    }
  }
}
