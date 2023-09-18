import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);
    return Container(
      width: width,
      height: height * 0.128,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            child: Image.network(
              'https://i.pinimg.com/564x/8c/8e/cb/8c8ecbf422f590259832b5ececfdda1d.jpg',
              width: width * 0.28,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.53,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: grey,
                        size: 14,
                      ),
                    )
                  ],
                ),
                const AppText(
                  text: 'Pullover',
                  fontSize: 16,
                  color: black,
                ),
                const SizedBox(
                  height: 6,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Color: ',
                    style: TextStyle(color: grey, fontSize: 11),
                    children: [
                      TextSpan(
                        text: 'Blue',
                        style: TextStyle(color: black, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ]),
                      child: const Icon(
                        Icons.remove_rounded,
                        color: grey,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const AppText(
                      text: '1',
                      fontSize: 14,
                      color: black,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ]),
                      child: const Icon(
                        Icons.add_rounded,
                        color: grey,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    const AppText(
                      text: '55\$',
                      fontSize: 14,
                      color: black,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
