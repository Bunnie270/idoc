import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:testklk/src/features/authentication/models/user_model.dart';
import 'package:testklk/src/features/authentication/screens/profilepage.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile ({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UpdateProfileState();
  
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage()));
          },
          child: Icon(
              LineAwesomeIcons.angle_left,
            color: Colors.deepPurple[800],
          ),
        ),

      ),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                //welcome back text

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
                            LineAwesomeIcons.camera,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),

                    ],
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
                      
                     // controller: _firstnameController,
                      decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.user),
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
                     // controller: _lastnameContoller,
                      decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.user),
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
                     // controller: _ageController,
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
                      //controller: _addressController,
                      decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.address_book),
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
                      //controller: _occupationController,
                      decoration: InputDecoration(
                          border:  InputBorder.none,
                          hintText: 'Occupation'
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
                      //controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.envelope),
                          border:  InputBorder.none,
                          hintText: 'Email'
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
                        icon: Icon(LineAwesomeIcons.fingerprint),
                          border:  InputBorder.none,
                          hintText: 'Old Password'
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
                      //controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.fingerprint),
                          border:  InputBorder.none,
                          hintText: 'New password'
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
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:BorderRadius.circular(12),


                    ),

                    child: const Center(
                      child: Text(
                        'Update Profile',
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
      
      
    ),
      ),
    );
    
    
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await
    FirebaseFirestore.instance.collection('users').where("email", isEqualTo: email).get();
    final userdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userdata;

  }
  
}