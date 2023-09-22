import 'package:dio/dio.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/app_storage/app_storage.dart';
import 'package:ecommerce/views/nav_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/user/user.dart';
import '../../core/router/router.dart';
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

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
          AppRouter.navigateAndPop(const NavBarView());
        } else {
          showSnakBar(
              'This email doesn\'t match of any users try to Register and then try again',
              error);
        }
      } catch (e) {
        showSnakBar(user!.message!, error);
      }

      emit(LoginInitial());
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
