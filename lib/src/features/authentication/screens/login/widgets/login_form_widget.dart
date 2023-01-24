import 'package:flutter/material.dart';

import '../../forgot_passwordpage.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(

        child: Column(
          children: [
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
                    //controller: _emailController,
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
                    //controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.fingerprint),
                        border:  InputBorder.none,
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp))
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //forgotpassword
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
                onTap: null,
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



          ],
        ),
      ),
    );
  }
}