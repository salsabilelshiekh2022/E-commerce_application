import 'package:ecommerce/constants.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/validator/validator.dart';
import '../../widgets/app_text.dart';
import '../../widgets/bottom_sheet.dart';
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
                SizedBox(
                  height: 32.h,
                ),
                const AppText(
                  text: 'Personal Information',
                  fontSize: 16,
                  color: black,
                ),
                SizedBox(
                  height: 21.h,
                ),
                AppTextFormField(
                  validator: (value) {
                    return Validator.validateName(value);
                  },
                  hintText: 'Full name',
                ),
                SizedBox(
                  height: 21.h,
                ),
                AppTextFormField(
                  validator: (value) {
                    return;
                  },
                  hintText: 'Date of birth',
                ),
                SizedBox(
                  height: 52.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      text: 'Password',
                      fontSize: 16,
                      color: black,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            context: context,
                            builder: (context) {
                              // return const AddNoteButtomSheet();
                              return const ShowBottomSheet();
                            });
                      },
                      child: const AppText(
                        text: 'Change',
                        fontSize: 14,
                        color: grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                const AppTextFormField(
                  hintText: '*********',
                  enable: false,
                ),
                SizedBox(
                  height: 55.h,
                ),
                const AppText(
                  text: 'Notifications',
                  fontSize: 16,
                  color: black,
                ),
                SizedBox(
                  height: 32.h,
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
                SizedBox(
                  height: 32.h,
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
                SizedBox(
                  height: 32.h,
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
