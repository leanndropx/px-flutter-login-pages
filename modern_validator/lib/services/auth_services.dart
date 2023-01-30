import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices extends GetxController {
  static AuthServices get to => Get.find<AuthServices>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = Rxn<User>();
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _firebaseUser = Rxn<User>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user != null){
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
    }
    });
  }

  User? get user => _firebaseUser.value;

  showSnack(String error, String message){
    return Get.snackbar(error, message,backgroundColor: Colors.grey[900],colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
  }

  createUser(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(e){
      print(e);
      showSnack('Erro', 'Não foi possível cadastrar o usuário');
    }
  }

  login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      print(e);
      showSnack('Erro', 'Não foi possível efetuar o login');
    }
  }

  logout()async{
    await _auth.signOut();
  }
}
