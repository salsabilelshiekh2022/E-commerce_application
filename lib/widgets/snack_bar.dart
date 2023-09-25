import 'package:flutter/material.dart';

import '../constants.dart';

void showSnackBar(String msg, Color color) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  scaffoldKey.currentState?.showSnackBar(snackBar);
}
