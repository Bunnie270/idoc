import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key ? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim()
      );
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text('Password reset link has been sent! Check your email and spam '),
        );
        },
      );

    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),

      body:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter Your Email So We Can Help You Reset Your Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),

            ),
          ),
          SizedBox(height: 10),

          //email textfeild
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border:  InputBorder.none,
                      hintText: 'Enter your email'
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          MaterialButton(
              onPressed: passwordReset,
            child: Text('Reset Password',
              style: TextStyle(
                color: Colors.white,
              ),

            ),
            color: Colors.deepPurple[200],

          )
        ],
      ),

      //email textfeild



    );
  }
}