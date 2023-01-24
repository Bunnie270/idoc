import 'package:flutter/material.dart';


class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already a member?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        const Text(

          'Log In',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'instead',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
