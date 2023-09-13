import 'package:flutter/material.dart';

import '../constants.dart' as constants;

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: constants.primaryAppColor),
      child: const Center(
          child: CircularProgressIndicator(
        color: constants.white,
      )),
    );
  }
}
