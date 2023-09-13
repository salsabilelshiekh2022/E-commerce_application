import 'package:flutter/material.dart';

const lightScaffoldBackgroundColor = Color(0xffF9F9F9);
const primaryAppColor = Color(0xffDB3022);
const black = Color(0xff222222);
const grey = Color(0xff9B9B9B);
const white = Color(0xffFFFFFF);
const success = Color(0xff2AA952);
const error = Color(0xffF01F0E);

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const String registerUrl = 'https://student.valuxapps.com/api/register';
const String loginUrl = 'https://student.valuxapps.com/api/login';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
