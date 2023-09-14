import 'package:ecommerce/core/assets/app_assets.dart';
import 'package:ecommerce/views/register/cubit.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:ecommerce/widgets/loading_button.dart';
import 'package:ecommerce/widgets/social_media_button.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/router/routes.dart';
import '../../core/validator/validator.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        final cubit = RegisterCubit.of(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: height * .11,
                  left: 14.0,
                  right: 14,
                  bottom: height * .0418),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Sign up",
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: height * .0899,
                      ),
                      AppTextFormField(
                        onSave: (data) {
                          cubit.name = data;
                        },
                        controller: cubit.nameController,
                        focusNode: cubit.nameFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(cubit.emailFocusNode);
                        },
                        hintText: 'Name',
                        validator: (value) {
                          return Validator.validateName(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFormField(
                        onSave: (data) {
                          cubit.email = data;
                        },
                        controller: cubit.emailController,
                        focusNode: cubit.emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(cubit.phoneFocuseNode);
                        },
                        hintText: 'Email',
                        validator: (value) {
                          return Validator.validateEmail(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFormField(
                        onSave: (data) {
                          cubit.phone = data;
                        },
                        controller: cubit.phoneController,
                        focusNode: cubit.phoneFocuseNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(cubit.passwordFocusNode);
                        },
                        hintText: 'Phone',
                        validator: (value) {
                          return Validator.validatePhone(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFormField(
                        onSave: (data) {
                          cubit.password = data;
                        },
                        secure: true,
                        controller: cubit.passwordController,
                        focusNode: cubit.passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        hintText: 'Password',
                        validator: (value) {
                          return Validator.validatePassword(value);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.loginPageRoute);
                          },
                          child: const AppText(
                            text: 'Already have an account? ',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .034482,
                      ),
                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            return state is RegisterLoading
                                ? const LoadingButton()
                                : AppButton(
                                    title: 'SignUp',
                                    onTap: () {
                                      cubit.register();
                                    },
                                  );
                          }),
                      SizedBox(
                        height: height * .085,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: 'Or sign up with social account ',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton(imagePath: AppAssets.googleAsset),
                          SizedBox(
                            width: 16,
                          ),
                          SocialMediaButton(
                            imagePath: AppAssets.faceBookAsset,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
