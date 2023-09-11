import 'package:ecommerce/views/forget_password/cubit.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/validator/validator.dart';
import '../../widgets/app_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Builder(builder: (context) {
        final cubit = ForgetPasswordCubit.of(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * .0418, horizontal: 14.0),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Forgot password",
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * .1071,
                    ),
                    const AppText(
                        text:
                            'Please, enter your email address. You will receive a link to create a new password via email.'),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFormField(
                      onSave: (data) {
                        cubit.email = data;
                      },
                      controller: cubit.emailController,
                      textInputAction: TextInputAction.done,
                      hintText: 'Email',
                      validator: (value) {
                        return Validator.validateEmail(value);
                      },
                    ),
                    SizedBox(
                      height: height * .0862,
                    ),
                    AppButton(
                      title: 'SEND',
                      onTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.formKey.currentState!.save();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
