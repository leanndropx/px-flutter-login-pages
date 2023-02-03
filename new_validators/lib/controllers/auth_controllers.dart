import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quinta/services/auth_services.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  var pageNotLoading = true.obs;

  createUser() async {
    pageNotLoading.value = false;
    await AuthServices.to.createUser(emailController.text, passwordController.text);
    pageNotLoading.value = true;
  }

  loginUser() async {
    pageNotLoading.value = false;
    await AuthServices.to.loginUser(emailController.text, passwordController.text);
    pageNotLoading.value = true;
  }

  logoutUser() async {
    await AuthServices.to.logoutUser();
  }

  resetControllers(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
    pageNotLoading.value = true;
  }

}


