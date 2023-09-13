import 'package:flutter/material.dart';

import '../constants.dart';

// void showSnacBar2(BuildContext context, String msg, Color color) {
//   scaffoldKey.currentState!.showSnackBar(SnackBar(
//     content: Text(
//       msg,
//       style: const TextStyle(fontSize: 16),
//       textAlign: TextAlign.center,
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     ),
//     backgroundColor: color,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   ));
// }

void showSnakBar(String msg, Color color) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  scaffoldKey.currentState?.showSnackBar(snackBar);
}
