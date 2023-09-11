import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterCubitInitial());

  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  static RegisterCubit of(context) => BlocProvider.of(context);
}
