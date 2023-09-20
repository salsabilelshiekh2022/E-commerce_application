import 'package:flutter/material.dart';

import '../../../constants.dart';

class RatingLine extends StatelessWidget {
  const RatingLine({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: primaryAppColor),
    );
  }
}
