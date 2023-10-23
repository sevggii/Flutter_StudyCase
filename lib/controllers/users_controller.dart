import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_case/views/loginPage.dart';

class UsersController extends GetxController {
  List<Map<String, dynamic>> users = [];

void fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey('data')) { 
        users = List<Map<String, dynamic>>.from(jsonData['data']);
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to fetch users');
    }
    
    update(); //send changes
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // delete all of data

    Get.off(LoginPage());

    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
