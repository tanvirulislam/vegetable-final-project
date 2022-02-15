// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/appbar.dart';
import 'package:project_signin_firebase/bottom_bar.dart';
import 'package:project_signin_firebase/colors.dart';

class CartClass extends StatefulWidget {
  const CartClass({Key? key}) : super(key: key);

  @override
  State<CartClass> createState() => _CartClassState();
}

class _CartClassState extends State<CartClass> {
  final Stream<QuerySnapshot> readyToCook =
      FirebaseFirestore.instance.collection('vegetableCartProduct').snapshots();
  var cartcount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarClass(),
        preferredSize: Size(200, 55),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Cart Review',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 500,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    elevation: 23,
                                    child: Image.network(
                                      '${data.docs[index]['productImage']}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${data.docs[index]['productName']}'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          'TK ${data.docs[index]['productPrice']}'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          'KG ${data.docs[index]['productWeight']}'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.delete),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              '-',
                                              style: TextStyle(fontSize: 33),
                                            ),
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 23),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              '+',
                                              style: TextStyle(fontSize: 33),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount: Tk 450'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
