import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var email = '';
  var password = '';

  bool get isEmailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  bool get isPasswordValid => password.length > 8;
  bool get isFormValid => isEmailValid && isPasswordValid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Obx(() => Text(AuthController.to.title.value)),
        actions: [
          TextButton(
              onPressed: toogleRegister,
              child: Obx(() => Text(AuthController.to.appBarButton.value)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: AuthController.to.emailController,
              onChanged: emailChanged,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: AuthController.to.passwordController,
              onChanged: passwordChanged,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 60)
              ),
                onPressed: isFormValid ? AuthController.to.isLogin.value ? AuthController.to.login : AuthController.to.register : null,
                child: Obx(() => Text(AuthController.to.mainButton.value)))
          ],
        ),
      ),
    );
  }

  void emailChanged(String value){
    setState(() {
      email = value;
    });
  }

  void passwordChanged(String value){
    setState(() {
      password = value;
    });
  }

  toogleRegister(){
    AuthController.to.isLogin.value = !AuthController.to.isLogin.value;
    AuthController.to.emailController.clear();
    AuthController.to.passwordController.clear();
    setState(() {
      email = '';
      password = '';
    });
  }


}
