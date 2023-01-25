
import 'package:get/get.dart';
import 'package:testklk/src/screens/welcome/onboarding_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();

  Future startAnimation() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(WelcomeScreen());
  }
}