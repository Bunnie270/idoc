import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testklk/src/features/authentication/controllers/signup_controller.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formkey = GlobalKey<FormState>();

    return Container(
      child: Form(
          key: _formkey,
          child: Column(
            children: [
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.firstname ,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your first name'),
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.lastname,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your last name'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //phonenumber textfeild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.phoneno,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your phone number'),
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //occupation textfeild
              /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  controller: controller.occupation,
                  decoration: InputDecoration(
                      border:  InputBorder.none,
                      hintText: 'Enter your occupation'
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),*/

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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.address,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your address'),
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: controller.password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              //sign up btn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      SignupController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
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
            ],
          )),
    );
  }
}
