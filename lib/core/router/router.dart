import 'package:flutter/material.dart';

import '../../constants.dart';

Route<dynamic>? onGenerate(RouteSettings settings) => null;

class AppRouter {
  static BuildContext context = navigatorKey.currentContext!;

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(_materialPageRoute(page));

  static Future<dynamic> navigateAndReplace(Widget page) =>
      navigatorKey.currentState!.pushReplacement(_materialPageRoute(page));

  static Future<dynamic> navigateAndPop(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );

  static void pop([Object? result]) => navigatorKey.currentState!.pop(result);

  static Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
