import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class AddingAddressCubit extends Cubit<AddingAddressState> {
  AddingAddressCubit() : super(AddingAddressInitial());

  final GlobalKey<FormState> formKey = GlobalKey();
  String? name, address, city, country, zipCode, region;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final nameFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final cityFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  final regionController = TextEditingController();
  final regionFocusNode = FocusNode();
  final zipCodeController = TextEditingController();
  final zipCodeFocusNode = FocusNode();

  static AddingAddressCubit of(context) => BlocProvider.of(context);
}
