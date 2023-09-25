import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class AddingAddressCubit extends Cubit<AddingAddressState> {
  AddingAddressCubit() : super(AddingAddressInitial());

  final GlobalKey<FormState> formKey = GlobalKey();
  String? name, address, city, country, zipCode, region;

  final nameFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final countryFocusNode = FocusNode();
  final regionFocusNode = FocusNode();
  final zipCodeFocusNode = FocusNode();
  static AddingAddressCubit of(context) => BlocProvider.of(context);
}
