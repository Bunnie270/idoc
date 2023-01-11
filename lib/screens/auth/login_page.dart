import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testklk/screens/auth/auth_service.dart';

import '../../components/square_tile.dart';
import 'forgot_passwordpage.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showSignupPage;
  const LoginPage({Key ? key, required this.showSignupPage}) : super (key: key);

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

              //password
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your password'
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ForgotPasswordPage();
                        },
                        ),
                        );
                        
              },
                      child: Text(
                          'Forgot Password?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                  )
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //log in btn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: logIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:BorderRadius.circular(12),


                      ),

                      child: const Center(
                        child: Text(
                            'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),

                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 50),

              //or continue with
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.6,
                      color: Colors.grey[400],
                    ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),

                    ),
                    ),
                    Expanded(child: Divider (
                      thickness: 0.5,
                      color:  Colors.grey[400],
                    ))
                  ],
                ),
                ),
              const SizedBox(height: 50),

              //google sign in btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SquareTile(
                        onTap: () => AuthService().signInwithGoogle(),
                        imagePath: 'assets/images/google.png'),
                  ],
                ),
              SizedBox(height: 50),

              //register instead btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignupPage,
                      child: Text(
                          'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),

                  ],
                )






            ],),
          ),
        ),
      ),
    );
  }
}