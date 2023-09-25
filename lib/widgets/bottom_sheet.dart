import 'package:ecommerce/views/setting/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../core/validator/validator.dart';
import 'app_button.dart';
import 'app_text.dart';
import 'app_text_form_field.dart';
import 'loading_button.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Builder(builder: (context) {
        final cubit = ChangePasswordCubit.of(context);
        return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is ChangePasswordLoading ? true : false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom == 0
                        ? 16
                        : 236.h,
                  ),
                  child: SizedBox(
                    height: 472.h,
                    child: Form(
                      key: cubit.formKey,
                      autovalidateMode: cubit.autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          AppText(
                            text: 'Password Change',
                            fontSize: 18.sp,
                            color: black,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          AppTextFormField(
                            hintText: 'Old Password',
                            onSave: (data) {
                              cubit.oldPassword = data;
                            },
                            focusNode: cubit.oldPasswordFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(cubit.newPasswordFocusNode);
                            },
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
                          AppTextFormField(
                            hintText: 'New Password',
                            onSave: (data) {
                              cubit.newPassword = data;
                            },
                            focusNode: cubit.newPasswordFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(cubit.comfirmPasswordFocusNode);
                            },
                            validator: (value) {
                              return Validator.validatePassword(value);
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppTextFormField(
                            hintText: 'Repeat New Password',
                            onSave: (data) {
                              cubit.comfirmPassword = data;
                            },
                            focusNode: cubit.comfirmPasswordFocusNode,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) return 'Field is required';
                              if (value != cubit.newPassword) {
                                return 'Password dosn\'t match';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          state is ChangePasswordLoading
                              ? const LoadingButton()
                              : AppButton(
                                  title: 'Save Password',
                                  onTap: () {
                                    cubit.changePasswword();
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
