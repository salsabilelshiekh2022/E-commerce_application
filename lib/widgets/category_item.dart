import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'app_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.image, required this.name, this.onTap});
  final String image;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.123,
        width: width,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: AppText(
                text: name,
                fontSize: 18,
                color: black,
              ),
            ),
            Image.network(
              image,
              width: 171.w,
              height: 100.h,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
