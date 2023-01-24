import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testklk/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:testklk/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpPage extends StatefulWidget {
  //final VoidCallback showLoginPage;

  const SignUpPage({
    Key? key,

  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //method to add user details to the datbase
  Future addUserDetails(String firstName, String lastName, String email,
      int age, String address, String occupation) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'address': address,
      'occupation': occupation,
    });
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
              children: const [
                //welcome back text
                Text(
                  'Hi There',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Welcome, we\'re pleased to have you!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 50),

                SignupFormWidget(),
                SizedBox(
                  height: 20,
                ),

                //login instead btn
                SignupFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
