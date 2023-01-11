import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testklk/Models/user_model.dart';
import 'package:testklk/screens/auth/login_page.dart';
import 'signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key ? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreens);
    } else{
      return SignUpPage(showLoginPage: toggleScreens);
    }
  }
}

//get info for profile screen
/*var myUser = UserModel();

getUserInfo(){
  
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection('users').doc(uid).snapshots().listen((event) {
  myUser.value =UserModel.fromJson(event.data()!);

  });
  
}*/