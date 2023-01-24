import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'package:testklk/src/screens/HomePage.dart';
import 'package:testklk/src/features/authentication/screens/profilepage.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key ? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];


  @override
  void initState() {
    super.initState();
    
    _pages = [
      ScreenHiddenDrawer(


          ItemHiddenMenu(
              name: 'HomePage',
              baseStyle:const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),
              selectedStyle:const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            colorLineSelected: Colors.deepPurple,
          ),
          const HomePage(),

      ),

      ScreenHiddenDrawer(


        ItemHiddenMenu(
          name: 'Profile Page',
          baseStyle:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
          selectedStyle:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          colorLineSelected: Colors.deepPurple,
        ),
        ProfilePage(),

      ),

    ];
    
  }
  @override
  Widget build( BuildContext context) {
    return HiddenDrawerMenu(


      withAutoTittleName: false,
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple.shade200,
      initPositionSelected: 0,
      slidePercent: 60,
      contentCornerRadius: 50,
      boxShadow: [],
      withShadow: false,
      backgroundColorAppBar: Colors.grey.shade300,
      elevationAppBar: 0,




      leadingAppBar:


      Container(

        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset("assets/icons/hamburger.png",
          color: Colors.grey.shade800,

          height: 50,
          width: 50,


        ),
      ),
      /*actionsAppBar: [
        IconButton(onPressed: () {}, icon: const Icon(Ionicons.notifications_circle_outline)),
        IconButton(onPressed: () {}, icon: const Icon(Ionicons.search_outline)
        )
      ],*/

      //Icon(Icons.menu_rounded,
       // color: Colors.grey[800],
        //size: 50,



     // ),

      



    );

    
  }
}