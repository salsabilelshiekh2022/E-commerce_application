import 'package:ecommerce/core/app_storage/app_storage.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'constants.dart' as constants;
import 'constants.dart';

void main() async {
  runApp(const MyApp());
  await AppStorage.appInitialization();
  token = AppStorage.getUser();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldKey,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          fontFamily: "Metropolis",
          appBarTheme: const AppBarTheme(
              backgroundColor: constants.lightScaffoldBackgroundColor,
              elevation: 0.0,
              iconTheme: IconThemeData(color: constants.black)),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: constants.primaryAppColor),
          scaffoldBackgroundColor: constants.lightScaffoldBackgroundColor,
        ),
        onGenerateRoute: onGenerate,
        initialRoute: token != null || token != ""
            ? AppRoutes.navBarRoute
            : AppRoutes.registerPageRoute);
  }
}
