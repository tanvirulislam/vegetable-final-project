import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/services/google_service.dart';

class CustomeDrawer extends StatelessWidget {
  AuthClass authClass = AuthClass();

  final Stream<QuerySnapshot> readyToCook =
      FirebaseFirestore.instance.collection('readyToCook').snapshots();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black),
              ),
              color: Colors.amber,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/a-/AOh14Gjeg3U6ZusBCUQRLaWEzEI2palBvBD0QaRpffshwQ=s288-p-rw-no',
                      ),
                    ),
                    // borderRadius: BorderRadius.circular(25),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Name : Mizan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Email : mizan@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wish-list'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Order'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              color: Colors.grey,
              border: Border(
                top: BorderSide(color: Colors.amber),
              ),
            ),
            child: const ListTile(
              leading: InkWell(child: (Icon(Icons.logout)),),
              title: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
