import 'package:flutter/material.dart';
import 'package:study_case/components/my_button.dart';
import 'package:study_case/components/my_textfield.dart';
import 'package:study_case/components/square_tile.dart';
import 'package:study_case/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

            //logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),
              
            //Welcome
            Text(
              'Welcome back you\'ve been missed!',
               style: TextStyle(color:Colors.grey[700],
               fontSize: 16,
               ),
            ),

            const SizedBox(height: 25),
              
            //email textfield
            MyTextField(
              controller: _loginController.mailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),
              
            //password textfield
            MyTextField(
              controller: _loginController.passwordController,
              hintText: 'Password',
              obscureText: true,
               
            ),

             const SizedBox(height: 10),
             
             //forgot password?
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text('Forgot Password?',
                   style: TextStyle(color: Colors.grey[600]),
                   ),
                 ],
               ),
             ),

             const SizedBox(height: 25),
              
      
            //sign in button 
            MyButton(
              onTap:(){
                _loginController.signUserIn();
              }
            ),

            const SizedBox(height: 50),
              
            //or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or continue with',
                    style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
              
            //google + apple sign in buttons
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //google button
              SquareTile(imagePath: 'lib/images/google.png'),

              SizedBox(width: 25),

              //apple button
              SquareTile(imagePath: 'lib/images/apple.png')
            ],
           ),

           const SizedBox(height: 50),

            //not a remember? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a remember?',
                  style: TextStyle(color: Colors.grey[700]),
                  ),
                const SizedBox(width: 4),
                const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            )
              
          ],
          ),
        ),
      ),
    );
  }
}