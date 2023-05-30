import 'package:flutte_challange/04_Project/scn/settings.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
import 'fav.dart';
import 'home.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final List _children = [
    Home(),
    Profile(),
    Fav(),
    Settings(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue[50],
          elevation: 0,
          iconSize: 25,
          selectedFontSize: 10,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue[200],
          onTap: onTappedBar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'
                // backgroundColor: Colors.blue,
                ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              //  backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              //  backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              //  backgroundColor: Colors.yellow,
            ),
          ]),
    );
  }
}
