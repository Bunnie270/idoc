import 'package:get/get.dart';
import 'package:testklk/repository/authentication_repository/authentication_repository.dart';
import 'package:testklk/src/screens/HomePage.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();


  void verifyOTP(String otp) async{
    var isverified = await AuthenticationRepository.instance.verifyOTP(otp);
    isverified ? Get.offAll(const HomePage()) : Get.back();

  }

}