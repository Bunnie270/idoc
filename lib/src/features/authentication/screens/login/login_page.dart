import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testklk/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:testklk/src/features/authentication/screens/login/widgets/login_form_widget.dart';



class LoginPage extends StatefulWidget{
 // final VoidCallback showSignupPage;
  const LoginPage({Key ? key}) : super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text conttollers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async{
    //display loading cricle
    showDialog(context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
    );
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );

    Navigator.of(context).pop();

  }

  //dispose of controllers
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              //welcome back text
              const Text(
                  'Hello Again!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),


              ),

              const SizedBox(height: 10),

              const Text('Welcome back, we\'ve missed you!',
                style: TextStyle(
                  fontSize: 20,
                ),


              ),
              const SizedBox(height: 50),
              LoginForm(),


              const SizedBox(height: 50),

              const LoginFooterWidget()

              //or continue with







            ],),
          ),
        ),
      ),
    );
  }
}


