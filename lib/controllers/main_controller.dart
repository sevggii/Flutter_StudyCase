import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  String? email;
  String? password;

  MainController() {
    _loginCheck();
  }

  void _loginCheck() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
    password = prefs.getString("password");
  }
}
