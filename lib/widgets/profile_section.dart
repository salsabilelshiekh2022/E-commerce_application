import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'app_text.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection(
      {super.key, required this.title, required this.subTitle, this.onTap});
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 72.h,
        width: width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      fontSize: 16.sp,
                      color: black,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    AppText(
                      text: subTitle,
                      fontSize: 11,
                      color: grey,
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: grey,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              thickness: .5,
              color: grey,
            )
          ],
        ),
      ),
    );
  }
}
