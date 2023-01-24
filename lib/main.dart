import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testklk/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testklk/repository/authentication_repository/authentication_repository.dart';
import 'package:testklk/src/features/authentication/screens/welcome/splashscreen/splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthenticationRepository()));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: true,

  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'I-Doc',
      theme: ThemeData(
        primaryColor: swatch2,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


