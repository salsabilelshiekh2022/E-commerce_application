import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
          itemCount: itemsName.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: AppText(
                    text: itemsName[index],
                    color: white,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List<String> itemsName = [
  "electrionic",
  "Medical",
  "sports",
  "Lighting",
  "Clothes",
];
