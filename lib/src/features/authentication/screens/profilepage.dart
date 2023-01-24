import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:testklk/updateprofilescreen.dart';
import '../../../components/profilemenu_widget.dart';

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
                Stack(
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
                   Positioned(
                     bottom: 0,
                     right: 0,
                     child: Container(
                        width: 35,
                        height: 35,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurple,
                               ),
                       child: const Icon(
                         LineAwesomeIcons.alternate_pencil,
                         color: Colors.white,
                         size: 20,
                       ),
                      ),
                   ),

                  ],
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

                //edit profile btn

                SizedBox(
                  width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () => Get.to(() => const UpdateProfile()),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:BorderRadius.circular(100),


                          ),

                          child: const Center(
                            child: Text(
                              'Edit Profile',
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

