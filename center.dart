import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth_services.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = "";
  String password = "";

  bool get isEmailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  bool get isPasswordValid => password.length >= 6;
  bool get isFormValid => isEmailValid & isPasswordValid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 9),
                        ))),
                const SizedBox(height: 40),
                const Center(
                    child: Text(
                      'hello, Money',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    )),
                Divider(),
                const Center(
                    child: Text(
                      'Following the world money',
                      style: TextStyle(color: Colors.white70,
                          fontSize: 8),
                    )),
                const Divider(),
                loginFieldBuilder('E-mail', emailChanged),
                const Divider(),
                loginFieldBuilder(
                    'Password', passwordChanged, obscure: true),
                const Divider(),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        onPrimary: Colors.black,
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: isFormValid ? (){} : null,
                    icon: FaIcon(FontAwesomeIcons.heart,
                        color: isFormValid ? Colors.white : Colors.white),
                    label: Text(
                      'Login',
                      style: TextStyle(color: isFormValid ? Colors.white : Colors.white),
                    )),

                TextButton(
                    onPressed: () {},
                    style:
                    TextButton.styleFrom(fixedSize: const Size(205, 0)),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Forgot the password?',
                        style:
                        TextStyle(color: Colors.white70, fontSize: 8),
                      ),
                    )),
                //const Divider(),
                const Divider(),
                const Text(
                  'Continue with: ',
                  style: TextStyle(color: Colors.white70, fontSize: 9),
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      AuthServices().getUserByGoogle();
                    },
                    icon: const FaIcon(FontAwesomeIcons.google,
                        color: Colors.red),
                    label: const Text('Google')),
                const Divider(),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.black,
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () async {
                      await AuthServices().getUserByFacebook();
                    },
                    icon: const FaIcon(FontAwesomeIcons.facebookF),
                    label: const Text('Facebook'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginFieldBuilder(String labelText, Function(String text) f,
      {bool obscure = false}) {
    return TextField(
        obscureText: obscure,
        onChanged: f,
        style: const TextStyle(color: Colors.white, fontSize: 15),
    decoration: InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.pink),
    border: const OutlineInputBorder(),
    )
    );
  }

  void emailChanged(String value) {
    setState(() {
      email = value;
    });
  }
  void passwordChanged(String value) {
    setState(() {
      password = value;
    });
  }
}
