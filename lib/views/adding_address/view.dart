import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';

class AddingAddressView extends StatelessWidget {
  const AddingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'Full name',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'Address',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'City',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'State/Province/Region',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'Zip Code (Postal Code)',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                validator: (value) {
                  return value;
                },
                hintText: 'Country',
              ),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                title: 'SAVE ADDRESS',
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
