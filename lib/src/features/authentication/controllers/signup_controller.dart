import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testklk/repository/authentication_repository/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //textfield controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phoneno = TextEditingController();

  //final occupation = TextEditingController();
  final address = TextEditingController();



  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
