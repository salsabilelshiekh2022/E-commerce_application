import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/NoData2.gif',
            width: double.infinity - 100,
            height: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Empty!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Sorry,You don't have any items at this time...",
          ).animate().fadeIn().scale().move(delay: 300.ms, duration: 600.ms),
        ],
      ),
    );
  }
}
