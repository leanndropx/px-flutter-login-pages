import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:segunda/pages/register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80,
        title: Text('LPX'),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(RegisterPage());
              },
              child: const Text('Cadastre-se'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white70))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password')),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 60)
              ),
            )
          ],
        ),
      ),
    );
  }
}
