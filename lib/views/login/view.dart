import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * .11, left: 14.0, right: 14, bottom: height * .0418),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: "Sign up",
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: height * .0899,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
