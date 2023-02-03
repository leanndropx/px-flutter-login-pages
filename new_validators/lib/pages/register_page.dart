
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quinta/controllers/auth_controllers.dart';
import 'package:quinta/pages/login_page.dart';
import 'package:quinta/widgets/app_buttons.dart';
import 'package:quinta/widgets/app_textfields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String password = '';

  bool get emailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  bool get passwordValid => password.length > 8;
  bool get formValid => emailValid && passwordValid;

  onEmailChanged(String value){
    setState(() {
      email = value;
    });
  }

  onPasswordChanged(String value){
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){

            AuthController.to.resetControllers();
            Get.off(LoginPage(),transition: Transition.leftToRight, duration: Duration(milliseconds: 500));

          },
        ),
        title: const Text('Cadastre-se'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: AuthController.to.pageNotLoading.value,
        replacement: Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextFields(labelText: 'Nome',controller: AuthController.to.firstNameController),
                const Divider(),
                AppTextFields(labelText: 'Sobrenome',controller: AuthController.to.lastNameController),
                const Divider(),
                AppTextFields(labelText: 'Email', actionButton: onEmailChanged, controller: AuthController.to.emailController),
                const Divider(),
                AppTextFields(labelText: 'Password', actionButton: onPasswordChanged, controller: AuthController.to.passwordController),
                const Divider(),
                AppTextFields(labelText: 'Confirme sua senha', controller: AuthController.to.passwordConfirmationController),
                const Divider(),
                const Divider(),
                AppEelevatedButtons(nameButton: 'Cadastrar',actionButton: formValid ? AuthController.to.createUser : null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

