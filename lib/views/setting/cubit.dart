import 'package:dio/dio.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/api_services/api_services.dart';
import '../../widgets/snak_bar.dart';

part 'state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final GlobalKey<FormState> formKey = GlobalKey();
  String? oldPassword, newPassword, comfirmPassword;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  final oldPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final comfirmPasswordFocusNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static ChangePasswordCubit of(context) => BlocProvider.of(context);

  Future<void> changePasswword() async {
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoading());
      try {
        final response = await ApiService(Dio()).post(data: {
          "current_password": oldPasswordController.text,
          "new_password": newPasswordController.text,
        }, url: 'change-password', token: token);

        if (response.data!['status']) {
          AppRouter.pop();
          showSnakBar('Password change successfully', success);
          debugPrint('yes');
        } else {
          AppRouter.pop();
          showSnakBar('Your old password is wrong', error);
        }
      } catch (e) {
        showSnakBar('Oops, try again', error);
      }
      emit(ChangePasswordInitial());
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
