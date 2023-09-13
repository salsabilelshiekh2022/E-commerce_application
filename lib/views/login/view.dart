import 'package:ecommerce/core/assets/app_assets.dart';
import 'package:ecommerce/views/login/cubit.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/router/routes.dart';
import '../../core/validator/validator.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/social_media_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.of(context);
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
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Login",
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 73,
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
                              .requestFocus(cubit.passwordFocusNode);
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
                                context, AppRoutes.forgetPasswordRoute);
                          },
                          child: const AppText(
                            text: 'Forgot your password? ',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03448,
                      ),
                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            return state is LoginLoading
                                ? const LoadingButton()
                                : AppButton(
                                    title: 'LOGIN',
                                    onTap: () {
                                      cubit.login();
                                    },
                                  );
                          }),
                      SizedBox(
                        height: height * .2339,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: 'Or login with social account',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton(imagePath: AppAssets.googleAssets),
                          SizedBox(
                            width: 16,
                          ),
                          SocialMediaButton(
                            imagePath: AppAssets.faceBookAssets,
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
