// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_signin_firebase/colors.dart';
import 'package:project_signin_firebase/services/google_service.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  AuthClass authClass = AuthClass();
  // var currentindex = 0;
  // final pages = [];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      elevation: 20,
      // currentIndex: currentindex,
      // onTap: (index) {
      //   setState(() {
      //     currentindex = index;
      //   });
      // },
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          backgroundColor: primaryColor,
          icon: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/welcome');
            },
            child: Icon(
              Icons.home,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: primaryColor,
          icon: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/favorite');
            },
            child: Icon(
              Icons.favorite,
            ),
          ),
          label: 'Fevrate',
          // activeIcon: Text(''),
        ),
        BottomNavigationBarItem(
          backgroundColor: primaryColor,
          icon: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          backgroundColor: primaryColor,
          icon: SizedBox(
            height: 30,
            child: IconButton(
              onPressed: () async {
                await authClass.logout();
                Navigator.pushNamed(context, '/signup');
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
          label: 'Logouts',
        ),
      ],
    );
  }
}
