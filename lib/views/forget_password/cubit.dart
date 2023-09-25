import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static ForgetPasswordCubit of(context) => BlocProvider.of(context);
}
