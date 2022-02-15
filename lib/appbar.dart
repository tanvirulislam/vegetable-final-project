import 'package:flutter/material.dart';
import 'package:project_signin_firebase/colors.dart';

class AppbarClass extends StatelessWidget {
  const AppbarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Fresh Food',
          style: TextStyle(color: textColor),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.shopping_cart, color: textColor),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/favorite');
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite, color: textColor),
            ),
          ),
          SizedBox(
            width: 4,
          ),
        ],
        bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(50),
        ));
  }
}
