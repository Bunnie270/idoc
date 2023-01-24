import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testklk/src/features/authentication/screens/signup/signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Heyo, Welcome to I-Doc',
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Get.to(() => SignUpPage()),
            child: OutlinedButton(
              onPressed: () {
                Get.to(SignUpPage());
              },
              child: Text(
                'Get Started',
              ),
            ),
          ),
        ],
      )),
    );
  }
}
