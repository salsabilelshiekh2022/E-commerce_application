import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../constants.dart';
import '../categories/view.dart';
import '../favorite/view.dart';
import '../home/view.dart';
import '../profile/view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final _controller = PersistentTabController();
  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CategoriesView(),
      Container(),
      const FavoriteView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house),
        title: "Home",
        activeColorPrimary: primaryAppColor,
        inactiveColorPrimary: const Color(0xff9B9B9B),
        iconSize: 22,
        textStyle: const TextStyle(fontSize: 10),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: "Shop",
        activeColorPrimary: primaryAppColor,
        inactiveColorPrimary: const Color(0xff9B9B9B),
        iconSize: 24,
        textStyle: const TextStyle(fontSize: 10),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag_outlined),
        title: "Cart",
        activeColorPrimary: primaryAppColor,
        inactiveColorPrimary: const Color(0xff9B9B9B),
        iconSize: 24,
        textStyle: const TextStyle(fontSize: 10),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border_outlined),
        title: "Favorites",
        activeColorPrimary: primaryAppColor,
        inactiveColorPrimary: const Color(0xff9B9B9B),
        iconSize: 22,
        textStyle: const TextStyle(fontSize: 10),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: "Profile",
        activeColorPrimary: primaryAppColor,
        inactiveColorPrimary: const Color(0xff9B9B9B),
        iconSize: 24,
        textStyle: const TextStyle(fontSize: 10),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(12.0),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  blurStyle: BlurStyle.solid),
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
        // Choose the nav bar style with this property.
      ),
    );
  }
}
