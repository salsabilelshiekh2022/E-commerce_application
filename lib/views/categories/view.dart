import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/views/search_by_category.dart/cubit.dart';
import 'package:ecommerce/views/search_by_category.dart/view.dart';
import 'package:ecommerce/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../constants.dart';
import '../../widgets/app_text.dart';
import '../../widgets/check_connection.dart';
import '../search/view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);

    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppRouter.navigateTo(SearchView());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              title: const AppText(
                text: 'Categories',
                fontSize: 18,
              ),
              centerTitle: true,
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.123,
                      width: width,
                      decoration: BoxDecoration(
                        color: primaryAppColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'SUMMER SALES',
                              fontSize: 24,
                              color: white,
                            ),
                            AppText(
                              text: 'Up to 50% off',
                              fontSize: 14,
                              color: white,
                            )
                          ]),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CategoryItem(
                            name: categoriesNames[index],
                            image: categoriesImages[index],
                            onTap: () {
                              SearchCubit.of(context)
                                  .getSearchData(categoriesNames[index]);
                              AppRouter.navigateTo(
                                SearchByCategoryView(
                                    title: categoriesNames[index]),
                              );
                            },
                          ),
                        );
                      },
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              ),
            )),
          );
        } else {
          return const CheckConnection();
        }
      },
      child: const SizedBox(),
    );
  }
}

List<String> categoriesNames = [
  "electrionic",
  "Medical",
  "sports",
  "Lighting",
  "Clothes",
];

List<String> categoriesImages = [
  "https://i.pinimg.com/564x/9a/a6/64/9aa66492c28bd11917d5902f8c555b5f.jpg",
  "https://i.pinimg.com/564x/c3/04/bc/c304bccd9a5c750f1b3e04173eca4d75.jpg",
  "https://i.pinimg.com/564x/4b/ed/b2/4bedb2e905e9027b0889f99dfaaf6c95.jpg",
  "https://i.pinimg.com/564x/65/ea/b5/65eab56e8b18a7b7b799e3dc9ea1dcfc.jpg",
  "https://i.pinimg.com/564x/37/07/40/37074073c493c7e32dd630bc7eeb5154.jpg",
];
