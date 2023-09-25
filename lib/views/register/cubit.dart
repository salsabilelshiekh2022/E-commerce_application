import 'package:dio/dio.dart';
import 'package:ecommerce/core/app_storage/app_storage.dart';
import 'package:ecommerce/views/nav_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/api_services/api_services.dart';
import '../../core/models/user/user.dart';
import '../../core/router/router.dart';
import '../../widgets/snack_bar.dart';

part 'state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  User? user;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name, phone;

  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final phoneFocuseNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static RegisterCubit of(context) => BlocProvider.of(context);

  Future<void> register() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      try {
        final response = await ApiService(Dio()).post(data: {
          "email": email!,
          "password": password!,
          "name": name!,
          "phone": phone!,
        }, url: 'register');
        user = User.fromJson(response.data);
        if (user!.status!) {
          //showSnakBar(user!.message!, success);
          await AppStorage.cacheUser(user!.data!.token!);
          AppRouter.navigateAndPop(const NavBarView());
        } else {
          showSnackBar(user!.message!, error);
        }
      } catch (e) {
        showSnackBar(user!.message!, error);
      }

      emit(RegisterInitial());
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
