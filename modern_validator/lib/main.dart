import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:segunda/controllers/auth_controller.dart';
import 'package:segunda/pages/auth_page.dart';
import 'package:segunda/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<AuthServices>(() => AuthServices());
  runApp(const Monday());
}

class Monday extends StatelessWidget {
  const Monday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthPage(),
    );
  }
}
