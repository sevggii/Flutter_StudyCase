import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_case/views/usersPage.dart';

class LoginController extends GetxController {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  signUserIn() async {
    const url = 'https://reqres.in/api/login';

    // Get email and password that user enters
    final email = mailController.text; //"eve.holt@reqres.in";
    final password = passwordController.text; //"cityslicka";

    final response = await http.post(Uri.parse(url), body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      saveLoginData(email, password);
      fetchLoginData();
    } else {
      Get.dialog(
        AlertDialog(
          title: Text("Wrong password"),
          content: Text("Invalid email or password, please try again :("),
          actions: [
            TextButton(
              child: Text("Okay"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  void saveLoginData(String? email, String? password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", email ?? '');
      await prefs.setString("password", password ?? '');

      print("Başarıyla Kaydedildi");

      Get.off(UsersPage());
    } catch (e) {
      print("Hata oluştu $e");
    }
  }

  Future<void> fetchLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString("email");
    String? storedPassword = prefs.getString("password");

    if (storedEmail != null && storedPassword != null) {
      print("Welcome: $storedEmail");
    } else {
      print("Email / Password incorrect :(");
    }
  }
}
