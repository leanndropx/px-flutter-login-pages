import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quinta/pages/login_page.dart';
import 'package:quinta/pages/register_page.dart';
import 'package:quinta/services/auth_services.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthServices.to.userIsAuthenticated.value ? RegisterPage() : LoginPage());
  }
}

