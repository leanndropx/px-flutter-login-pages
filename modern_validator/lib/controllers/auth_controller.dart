import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:segunda/services/auth_services.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  var title = 'Login'.obs;
  var appBarButton = 'Register'.obs;
  var mainButton = 'Register'.obs;
  var isLogin = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    ever(isLogin, (visible) {
      title.value = visible ? 'Login' : 'Register';
      appBarButton.value = visible ? 'Register' : 'Login';
      mainButton.value = visible ? 'Login' : 'Register';
    });
  }


  login() async {
    isLoading.value = true;
    await AuthServices.to.login(emailController.text, passwordController.text);
    isLoading.value = false;
  }

  register() async {
    isLoading.value = true;
    await AuthServices.to.createUser(emailController.text, passwordController.text);
    isLoading.value = false;
  }

  logout() async {
    await AuthServices.to.logout();
  }

}
