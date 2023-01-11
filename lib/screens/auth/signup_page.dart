import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({Key ? key,
    required this.showLoginPage,

  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameContoller = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();
  final _addressController = TextEditingController();



  //dispose of controllers
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameContoller.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if (passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //add user details
      addUserDetails(
          _firstnameController.text.trim(),
          _lastnameContoller.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),
          _addressController.text.trim(),
          _occupationController.text.trim(),
      );

    }



  }

  //method to add user details to the datbase
  Future addUserDetails(String firstName, String lastName, String email, int age, String address, String occupation ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'address': address,
      'occupation': occupation,

    });
  }

  //checking if password == confirmed password
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  'Hi There',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),


                ),

                const SizedBox(height: 10),

                const Text('Welcome, we\'re pleased to have you!',
                  style: TextStyle(
                    fontSize: 20,
                  ),


                ),
                const SizedBox(height: 50),

                //firstname textfeild
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
                        controller: _firstnameController,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your first name'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                //last name textfeild
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
                        controller: _lastnameContoller,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your last name'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                //age textfeild
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
                        controller: _ageController,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your age'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                //address textfeild
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
                        controller: _addressController,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your address'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                //occupational textfeild
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
                        controller: _occupationController,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Enter your occupation'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

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
                const SizedBox(height: 10),

                // confirm password
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
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border:  InputBorder.none,
                            hintText: 'Confirm your password'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //sign up btn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:BorderRadius.circular(12),


                      ),

                      child: const Center(
                        child: Text(
                          'Sign Up',
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
                const SizedBox(height: 25),

                //register instead btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Log In instead',
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