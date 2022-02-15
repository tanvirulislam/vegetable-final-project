// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_signin_firebase/colors.dart';

class SingleProduct2 extends StatelessWidget {
  const SingleProduct2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
        actions: [
           InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/favorite');
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Deshi Fish',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Image.network(
                'https://www.beshideshi.com/wp-content/uploads/2019/06/RuiFish.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Weight: 1KG'),
                  Text('Price: Tk1 200'),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'About This Fish',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'This fish is very Fresh. and it store without any formalin. The rohu, rui, or roho labeo is a species of fish of the carp family, found in rivers in South Asia. It is a large omnivore and extensively used in aquaculture.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        elevation: 20,
        backgroundColor: primaryColor,

        // ignore: prefer_const_literals_to_create_immutables
        items: [
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
            label: 'Add to Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Icon(Icons.shopping_cart, color: Colors.white,)),
            label: 'Add to Cart',
            // activeIcon: Text(''),
          ),
        ],
      ),
    );
  }
}
