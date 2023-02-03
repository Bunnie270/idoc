import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testklk/repository/authentication_repository/authentication_repository.dart';
import 'package:testklk/repository/user_repository/user_repository.dart';
import 'package:testklk/src/features/authentication/models/user_model.dart';
import 'package:testklk/src/features/authentication/screens/otp/otp_phone_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //textfield controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phoneno = TextEditingController();

  //final occupation = TextEditingController();
  //final address = TextEditingController();

  final userRepo = Get.put(UserRepository());



  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  //get user details from user
  Future <void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());

  }

  //get phoneno from user and pass it to Auth repository for Firebae Authentication
void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);

}
}
