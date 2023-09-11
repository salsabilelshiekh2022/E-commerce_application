import 'package:ecommerce/views/forget_password/view.dart';
import 'package:ecommerce/views/login/view.dart';
import 'package:ecommerce/views/register/view.dart';
import 'package:flutter/cupertino.dart';

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

    default:
      return CupertinoPageRoute(
          builder: (_) => const RegisterView(), settings: settings);
  }
}
