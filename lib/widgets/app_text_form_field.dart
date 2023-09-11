import 'package:flutter/material.dart';

import '../constants.dart' as constants;

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    required this.validator,
    this.onSave,
    this.controller,
    this.onChange,
    this.onSubmitted,
    this.secure,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
  });
  final bool? secure;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSave;
  final void Function(String)? onChange;
  final void Function(String?)? onSubmitted;
  final FocusNode? focusNode;

  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadiusDirectional.circular(4),
      child: TextFormField(
        enabled: true,
        onSaved: onSave,
        onFieldSubmitted: onSubmitted,
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: constants.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: constants.white,
            ),
          ),
          enabledBorder: inputBorder(constants.white),
          focusedBorder: inputBorder(constants.primaryAppColor),
          errorBorder: inputBorder(constants.error),
          focusedErrorBorder: inputBorder(constants.error),
        ),
      ),
    );
  }
}

InputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(color: color),
  );
}
