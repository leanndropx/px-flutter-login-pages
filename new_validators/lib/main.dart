import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quinta/controllers/auth_controllers.dart';
import 'package:quinta/pages/login_page.dart';
import 'package:quinta/services/auth_services.dart';
import 'package:quinta/widgets/check_auth.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut<AuthServices>(() => AuthServices());
  Get.lazyPut<AuthController>(() => AuthController());
  runApp(const Quinta());
}

class Quinta extends StatelessWidget {
  const Quinta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CheckAuth(),
    );
  }
}
