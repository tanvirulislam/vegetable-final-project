// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/colors.dart';

class AllProductList extends StatelessWidget {
  final Stream<QuerySnapshot> readyToCook =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            height: 188,
            width: 600,
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
                    scrollDirection: Axis.horizontal,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Card(
                          elevation: 33,
                          child: Column(
                            children: [
                              Image.network(
                                '${data.docs[index]['productImage']}',
                                height: 100,
                                width: 150,
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
                                        SizedBox(width:18),
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
                                         SizedBox(width:8),
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
    );
  }
}
