import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testklk/components/hidden_drawer.dart';
import 'package:testklk/screens/auth/authpage.dart';

import 'auth/Verify_emailpage.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return AuthPage();


          }
        }
      ),
    );
  }
}