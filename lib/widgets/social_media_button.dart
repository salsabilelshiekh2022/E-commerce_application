import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../constants.dart' as constants;

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 92,
        height: 94,
        decoration: BoxDecoration(
          color: constants.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: IconButton(
          icon: SvgPicture.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ));
  }
}
