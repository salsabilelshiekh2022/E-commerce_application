import 'package:ecommerce/constants.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../core/validator/validator.dart';
import '../../widgets/app_text.dart';
import '../../widgets/switch_button.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const AppText(
            text: 'Settings',
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                const AppText(
                  text: 'Personal Information',
                  fontSize: 16,
                  color: black,
                ),
                const SizedBox(
                  height: 21,
                ),
                AppTextFormField(
                  validator: (value) {
                    return Validator.validateName(value);
                  },
                  hintText: 'Full name',
                ),
                const SizedBox(
                  height: 21,
                ),
                AppTextFormField(
                  validator: (value) {
                    return;
                  },
                  hintText: 'Date of birth',
                ),
                const SizedBox(
                  height: 52,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Password',
                      fontSize: 16,
                      color: black,
                    ),
                    AppText(
                      text: 'Change',
                      fontSize: 14,
                      color: grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                AppTextFormField(
                  hintText: '*********',
                  validator: (value) {
                    return Validator.validatePassword(value);
                  },
                ),
                const SizedBox(
                  height: 55,
                ),
                const AppText(
                  text: 'Notifications',
                  fontSize: 16,
                  color: black,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Sales',
                      fontSize: 14,
                    ),
                    SwitchButton(),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'New arrivals',
                      fontSize: 14,
                    ),
                    SwitchButton(),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Delivery status changes',
                      fontSize: 14,
                    ),
                    SwitchButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
