import 'package:ecommerce/constants.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HeaderOfList extends StatelessWidget {
  const HeaderOfList({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: title,
                color: black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              const AppText(
                text: 'View all',
                color: black,
                fontSize: 11,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          AppText(
            text: subTitle,
            color: grey,
            fontSize: 11,
          ),
        ],
      ),
    );
  }
}
