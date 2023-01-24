import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testklk/src/features/authentication/screens/welcome/splashscreen/controller/splashscreen_controller.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   final splashController = Get.put(SplashScreenController());



  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    return Scaffold(
      body: Column(
        children: const [
          Positioned(
            bottom: 100,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(image: AssetImage("assets/logos/logo.png")),
              )
          ),
        ],
      ),
    );
  }
}
