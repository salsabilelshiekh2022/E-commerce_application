import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/app_text_form_field.dart';

class PromoCodeField extends StatelessWidget {
  const PromoCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          hintText: 'Enter your promo code',
          fillColor: white,
          filled: true,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: white,
            ),
          ),
          enabledBorder: inputBorder(white),
          focusedBorder: inputBorder(primaryAppColor),
          errorBorder: inputBorder(error),
          focusedErrorBorder: inputBorder(error),
          suffixIcon: const Icon(
            Icons.arrow_circle_right_rounded,
            color: black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
