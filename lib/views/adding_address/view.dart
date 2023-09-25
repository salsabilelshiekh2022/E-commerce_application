import 'package:ecommerce/core/validator/validator.dart';
import 'package:ecommerce/views/adding_address/cubit.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_text.dart';

class AddingAddressView extends StatelessWidget {
  const AddingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddingAddressCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: 'Adding Shipping Address',
            fontSize: 18,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Builder(builder: (context) {
              final cubit = AddingAddressCubit.of(context);
              return Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      hintText: 'Full name',
                      focusNode: cubit.nameFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(cubit.addressFocusNode);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      focusNode: cubit.addressFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(cubit.cityFocusNode);
                      },
                      hintText: 'Address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      focusNode: cubit.cityFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(cubit.regionFocusNode);
                      },
                      hintText: 'City',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      focusNode: cubit.regionFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(cubit.zipCodeFocusNode);
                      },
                      hintText: 'State/Province/Region',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      focusNode: cubit.zipCodeFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(cubit.countryFocusNode);
                      },
                      hintText: 'Zip Code (Postal Code)',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        return Validator.validateAnotherField(value);
                      },
                      focusNode: cubit.countryFocusNode,
                      textInputAction: TextInputAction.done,
                      hintText: 'Country',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AppButton(
                      title: 'SAVE ADDRESS',
                      onTap: () {
                        cubit.formKey.currentState!.save();

                        if (cubit.formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
