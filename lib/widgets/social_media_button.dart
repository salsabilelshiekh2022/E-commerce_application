import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import '../constants.dart' as constants;

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 92.w,
        height: 94.h,
        decoration: BoxDecoration(
          color: constants.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: IconButton(
          icon: SvgPicture.asset(
            imagePath,
            width: 24.w,
            height: 24.h,
          ),
          onPressed: () {},
        ));
  }
}
