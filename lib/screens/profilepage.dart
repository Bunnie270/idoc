import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:testklk/screens/HomePage.dart';

import '../components/profilemenu_widget.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView (
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child:  Center(
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,

                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.contain
                      )
                    ),

                  ),
                ),
                const SizedBox(height: 10,),
                Text("Njamgue Glen",
                  style: Theme.of(context).textTheme.headline4
                ),
                Text(
                    "goldenemperor270@gmail.com",
                style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 20,),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(onPressed: () => Get.to(() => const HomePage()),
                      child: const Text("Edit Profile", style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[500],
                      side: BorderSide.none,
                      shape: StadiumBorder()
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Divider(),
                const SizedBox(height: 10,),
                 ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){},),
                ProfileMenuWidget(title: "Appointments", icon: LineAwesomeIcons.calendar, onPress: (){},),
                ProfileMenuWidget(
                  title: "Logout",
                  textColor: Colors.red,
                  icon: LineAwesomeIcons.alternate_sign_out,
                  endIcon: false,
                  onPress: (){
                    FirebaseAuth.instance.signOut();
                  },),


              ],
            ),
          ),


        ),
      ),
    );
  }

}

