import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset(
            'assets/images/NoConnection2.gif',
            width: double.infinity - 100,
            height: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'No Internet connection',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Check your connection, then refresh the page.. ",
          ),
          // .animate()
          // .fadeIn() // uses `Animate.defaultDuration`
          // .scale() // inherits duration from fadeIn
          // .move(delay: 300.ms, duration: 600.ms),
        ],
      ),
    );
  }
}
