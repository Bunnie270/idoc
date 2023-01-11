import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testklk/components/hidden_drawer.dart';


class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState  createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;

  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;



  @override
  void initState() {

    user = auth.currentUser!;
    user.sendEmailVerification();
    
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();

    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (isEmailVerified){
      return HiddenDrawer();
    }

    return Scaffold(
      body:  Center(
        child: Text(
          'An email has been sent to ${user.email} please verify'
        ),
      ),



    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>HiddenDrawer()
          )
      );
    }
  }
}