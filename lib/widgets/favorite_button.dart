import 'package:flutter/material.dart';

import '../constants.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 4), blurRadius: 4)
            ]),
        child: const Icon(
          Icons.favorite_outline_rounded,
          color: grey,
          size: 16,
        ),
      ),
    );
  }
}
