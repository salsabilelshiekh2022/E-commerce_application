import 'package:ecommerce/constants.dart';
import 'package:ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../core/router/routes.dart';
import '../../widgets/profile_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: 'My profile',
                  fontSize: 34,
                  color: black,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.network(
                        'https://i.pinimg.com/564x/8c/8e/cb/8c8ecbf422f590259832b5ececfdda1d.jpg',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Matilda Brown',
                          fontSize: 18,
                          color: black,
                        ),
                        AppText(
                          text: 'matildabrown@mail.com',
                          fontSize: 14,
                          color: grey,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                const ProfileSection(
                  title: 'My orders',
                  subTitle: 'Already have 12 orders',
                ),
                ProfileSection(
                  title: 'Shipping addresses',
                  subTitle: '3 ddresses',
                  onTap: () {
                    navigatorKey.currentState!
                        .pushNamed(AppRoutes.shoppingAddressPageRoute);
                  },
                ),
                const ProfileSection(
                  title: 'Payment methods',
                  subTitle: 'Visa  **34',
                ),
                const ProfileSection(
                  title: 'Promocodes',
                  subTitle: 'You have special promocodes',
                ),
                const ProfileSection(
                  title: 'My reviews',
                  subTitle: 'Reviews for 4 items',
                ),
                ProfileSection(
                  title: 'Settings',
                  subTitle: 'Notifications, password',
                  onTap: () {
                    navigatorKey.currentState!
                        .pushNamed(AppRoutes.settingPageRoute);
                  },
                ),
              ],
            )),
      )),
    );
  }
}
