import 'package:flutter/material.dart';

import '../constants.dart' as constants;

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.color = constants.black,
      this.fontSize = 14,
      this.fontWeight});
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
