import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quinta/controllers/auth_controllers.dart';

class AuthServices extends GetxController {
  static AuthServices get to => Get.find<AuthServices>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  var firebaseUser;
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    firebaseUser = Rxn<User>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());

    ever(firebaseUser, (User? user) {
      if(user != null){
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User? get user => firebaseUser.value;

  showSnackError(String title, String message){
    return Get.snackbar(title, message, backgroundColor: Colors.red, colorText: Colors.white, snackPosition: SnackPosition.TOP,duration: Duration(seconds: 1));
  }

  createUser(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).timeout(Duration(seconds: 10));
    } catch(e){
      print(e);
      showSnackError('Não foi possível criar um usuário', 'Verifique as informações inseridas e tente novamente');
    }
  }

  loginUser(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          print("The email address is badly formatted.");
          showSnackError('Email inválido', 'E-mail inserido em formato inválido');
          break;
        case "ERROR_WRONG_PASSWORD":
          print("The password is incorrect.");
          showSnackError('Senha incorreta', 'Insira a senha correta');
          break;
        case "ERROR_USER_NOT_FOUND":
          print("User with this email doesn't exist.");
          showSnackError('Email não cadastrado', 'Não encontramos um usuário cadastrado com este e-mail que você inseriu');
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          print("Too many requests. Try again later.");
          showSnackError('Requisições excedidas', 'Você tentou fazer muitas requisições, tente mais tarde');
          break;
        case "ERROR_NETWORK_REQUEST_FAILED":
          print("Network error. Check your connection and try again.");
          showSnackError('Problemas com conexão', 'Verifique sua conexão e tente novamente');
          break;
        default:
          print("An undefined Error happened.");
          showSnackError('Erro', 'Tente novamente mais tarde');
      }
    } catch(e){
      print(e);
      showSnackError('Não foi possível fazer login', 'Verifique as informações inseridas e tente novamente');
    }
  }


  logoutUser() async {
    await _auth.signOut();
  }
}
