import 'package:ecommerce/views/forget_password/view.dart';
import 'package:ecommerce/views/login/view.dart';
import 'package:ecommerce/views/product/view.dart';
import 'package:ecommerce/views/register/view.dart';
import 'package:ecommerce/views/setting/view.dart';
import 'package:flutter/cupertino.dart';

import '../../views/nav_bar/view.dart';
import '../../views/product/products_model.dart';
import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
          builder: (_) => const LoginView(), settings: settings);
    case AppRoutes.registerPageRoute:
      return CupertinoPageRoute(
          builder: (_) => const RegisterView(), settings: settings);
    case AppRoutes.forgetPasswordRoute:
      return CupertinoPageRoute(
          builder: (_) => const ForgetPasswordView(), settings: settings);
    case AppRoutes.navBarRoute:
      return CupertinoPageRoute(
          builder: (_) => const NavBarView(), settings: settings);
    case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
          builder: (_) => const NavBarView(), settings: settings);
    case AppRoutes.productPageRoute:
      final product = settings.arguments as Datum;
      return CupertinoPageRoute(
          builder: (_) => ProductView(
                product: product,
              ),
          settings: settings);

    case AppRoutes.settingPageRoute:
      return CupertinoPageRoute(
          builder: (_) => const SettingView(), settings: settings);

    default:
      return CupertinoPageRoute(
          builder: (_) => const RegisterView(), settings: settings);
  }
}
