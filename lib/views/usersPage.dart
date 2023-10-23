import 'package:flutter/material.dart';
import 'package:study_case/controllers/users_controller.dart';
import 'package:get/get.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key});

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  
  final _usersController = Get.put(UsersController());

   @override
   void initState() { 
     super.initState();
     _usersController.fetchUsers();
   }

   Widget build(BuildContext context) { 
     return Scaffold(
       appBar: AppBar(
         title: const Text('Users List'),
         actions: [
           IconButton(
             icon: Icon(Icons.logout),
              onPressed: () async {
              await _usersController.logout();
              }
           ),
         ],
       ),
       body: ListView.builder(
         itemCount: _usersController.users.length,
         itemBuilder:(context, index){
           final user = _usersController.users[index];
           return ListTile(
             leading:
               CircleAvatar(backgroundImage: NetworkImage(user['avatar'])),
             title: Text('${user['first_name']} ${user['last_name']}'),
             subtitle: Text(user['email']),
           );
         },
       ),
     );
   }
}