import 'package:ecommerce/core/app_storage/app_storage.dart';
import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/core/router/routes.dart';
import 'package:ecommerce/views/cart/cubit.dart';
import 'package:ecommerce/views/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart' as constants;
import 'constants.dart';
import 'views/favorite/cubit.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
  await AppStorage.appInitialization();
  token = AppStorage.getUser();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
        ),
        BlocProvider(create: (context) => FavoriteCubit()..getFavorits()),
        BlocProvider(create: (context) => CartCubit()..getCartItems()),
      ],
      child: MaterialApp(
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
              : AppRoutes.registerPageRoute),
    );
  }
}
