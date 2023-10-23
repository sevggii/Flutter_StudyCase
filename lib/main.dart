import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_case/views/usersPage.dart';
import 'package:study_case/views/loginPage.dart';
import 'package:study_case/controllers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    if (_mainController.email != null && _mainController.password != null) {
      return GetMaterialApp(
        home: UsersPage(),
      );
    } else { 
      return GetMaterialApp(
        home: LoginPage(),
      );
    }
  }
}