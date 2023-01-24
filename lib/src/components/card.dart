

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cardbanner extends StatelessWidget {
  const Cardbanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Container(

     width: double.infinity,
     height: 150,
     padding: const EdgeInsets.symmetric(
       vertical: 22,
       horizontal: 20,
     ),
     decoration: BoxDecoration(
       color: Color(0xff5f75c7).withOpacity(.8),
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(0.1),
           spreadRadius: 4,
           offset: Offset(0, 8),
           blurRadius: 10,

         ),
       ],
       borderRadius: BorderRadius.circular(20),

     ),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           height: 80,
           width: 80,
           decoration: const BoxDecoration(

             shape: BoxShape.circle,
             image: DecorationImage(image: AssetImage("assets/images/doctorz.png",
             ),
             scale: 5,

             fit: BoxFit.cover,

             )
           ),
         ),

         SizedBox(width: 20),
         Column(
           children: [
             SizedBox(
               height: 8
             ),
             Text("Dr. Winnie Pooh",
             textAlign: TextAlign.left,
             style: TextStyle(
               color: Colors.white,
               fontSize: 15,
               fontWeight: FontWeight.bold,
             ),
             ),
             SizedBox(height: 5),
             Text("Heart Surgeon",
             textAlign: TextAlign.left,
             style: TextStyle(
               color: Colors.white70,
               fontSize: 12,
             ),)
           ],
         )
         

       ],
     ),



   );

  }


}