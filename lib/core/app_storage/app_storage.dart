import 'package:ecommerce/core/router/router.dart';
import 'package:ecommerce/views/login/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static late SharedPreferences _preferences;

  static Future appInitialization() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> cacheUser(String token) async {
    await _preferences.setString('token', token);
  }

  static getUser() {
    return _preferences.getString('token') ?? "";
  }

  static clearCache() {
    _preferences.remove('token');
    // navigatorKey.currentState!
    //     .pushNamedAndRemoveUntil(AppRoutes.loginPageRoute, (_) => false);
    AppRouter.navigateAndPop(const LoginView());
  }
}
