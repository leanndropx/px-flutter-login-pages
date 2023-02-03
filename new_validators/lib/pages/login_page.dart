import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quinta/controllers/auth_controllers.dart';
import 'package:quinta/pages/register_page.dart';
import 'package:quinta/widgets/app_buttons.dart';
import 'package:quinta/widgets/app_textfields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  bool get emailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  bool get passwordValid => password.length > 8;

  bool get formValid => emailValid && passwordValid;

  onEmailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  onPasswordChanged(String value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        elevation: 0,
        title: Text('Bem-vindo'),
        actions: [
          TextButton(
              onPressed: () {
                AuthController.to.resetControllers();
                Get.off(RegisterPage(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 300));
              },
              child: Text('Cadastre-se'))
        ],
      ),
      body: Obx(() => Visibility(
            visible: AuthController.to.pageNotLoading.value,
            replacement: const CircularProgressIndicator(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppTextFields(
                        labelText: 'Email',
                        actionButton: onEmailChanged,
                        controller: AuthController.to.emailController),
                    const Divider(),
                    AppTextFields(
                        labelText: 'Password',
                        actionButton: onPasswordChanged,
                        controller: AuthController.to.passwordController),
                    const Divider(),
                    const Divider(),
                    ElevatedButton(
                      onPressed: formValid ? AuthController.to.loginUser : null,
                      child: Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60)),
                    )

                    //AppEelevatedButtons(nameButton: 'Entrar',actionButton: formValid ? AuthController.to.loginUser: null),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
