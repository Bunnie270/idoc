import 'package:flutter/material.dart';

import '../../../../../components/square_tile.dart';
import '../../auth_service.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
             // onTap: widget.showSignupPage,
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

      ],

    );
  }
}
