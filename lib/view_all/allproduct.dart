// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/appbar.dart';
import 'package:project_signin_firebase/bottom_bar.dart';
import 'package:project_signin_firebase/colors.dart';

class AllProductView extends StatelessWidget {
  final Stream<QuerySnapshot> readyToCook =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        child: AppbarClass(),
        preferredSize: Size(200, 55),
      ),
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'All Products',
                  style: TextStyle(
                    fontSize: 18,
                    // ignore: prefer_const_literals_to_create_immutables
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
            Container(
              height: 620,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: readyToCook,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Somthing wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      strokeWidth: 1,
                    );
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Card(
                            elevation: 33,
                            child: Column(
                              children: [
                                Image.network(
                                  '${data.docs[index]['productImage']}',
                                  height: 220,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${data.docs[index]['productName']}'),
                                      Text(
                                          'TK ${data.docs[index]['productPrice']}'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${data.docs[index]['productWeight']} KG'),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Buy now',
                                          style: TextStyle(color: textColor),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
