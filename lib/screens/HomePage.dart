import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testklk/components/card.dart';

import '../specialitycard.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key ? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi Glen,',
                      style: TextStyle(
                        fontSize: 30,

                      ),
                      ),
                      Text("How are you feeling?",
                      style: TextStyle(
                        fontSize: 15,
                        color:  Colors.grey[600],
                      ),),
                    ],
                  ),
                ),
               SizedBox(height: 25),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Cardbanner(),
                ),

                SizedBox(height: 15,),

                //searchbar
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          spreadRadius: 4,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        )
                      ]                  ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 30,
                            child: Icon(
                              Icons.search_outlined,
                            color: Colors.grey[600],

                            ),
                          ),
                        ),
                        Expanded(child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a doctor...',
                          ),
                        ))
                      ],
                    ),
                  ),





                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(" Available Specialities",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                
                SizedBox(height: 25),

                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Specialities(
                            specialityName: 'Surgeon',
                            speclogoImagePath: 'assets/images/surgeon.png'
                        );
                      }

                  ),
                )

                /* Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: MaterialButton(onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                    color: Colors.deepPurple[200],
                    child: Text('Log Out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                )*/
              ],
            )


        ),
      ),

    );
  }
}