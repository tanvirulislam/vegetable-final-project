// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/appbar.dart';
import 'package:project_signin_firebase/bottom_bar.dart';
import 'package:project_signin_firebase/colors.dart';
import 'package:project_signin_firebase/custome_drawer.dart';
import 'package:project_signin_firebase/services/google_service.dart';
import 'package:project_signin_firebase/view_all/product.dart';
import 'package:project_signin_firebase/view_all/vegeCategory.dart';

class Newpage extends StatelessWidget {
  AuthClass authClass = AuthClass();

  final Stream<QuerySnapshot> readyToCook =
      FirebaseFirestore.instance.collection('readyToCook').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarClass(),
        preferredSize: Size(200, 55),
      ),
      drawer: CustomeDrawer(),
      bottomNavigationBar: BottomBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      'assets/2.png',
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 33,
                        child: Card(
                          shape: CircleBorder(),
                          elevation: 33,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                '25% off',
                                style: TextStyle(
                                  // fontSize: 33,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/product');
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 600,
                child: ProductCategory(),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Products',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/product');
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 600,
                child: AllProductList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
