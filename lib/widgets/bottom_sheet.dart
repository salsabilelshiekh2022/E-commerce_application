import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_button.dart';
import 'app_text.dart';
import 'app_text_form_field.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 16 : 236,
        ),
        child: SizedBox(
          height: 472,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const AppText(
                text: 'Password Change',
                fontSize: 18,
                color: black,
              ),
              const SizedBox(
                height: 18,
              ),
              const AppTextFormField(
                hintText: 'Old Password',
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    //AppRouter.navigateTo(const ForgetPasswordView());
                  },
                  child: const AppText(
                    text: 'Forgot your password? ',
                    color: grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const AppTextFormField(
                hintText: 'New Password',
              ),
              const SizedBox(
                height: 24,
              ),
              const AppTextFormField(
                hintText: 'Repeat New Password',
              ),
              const SizedBox(
                height: 32,
              ),
              const AppButton(title: 'Save Password'),
            ],
          ),
        ),
      ),
    );
  }
}
