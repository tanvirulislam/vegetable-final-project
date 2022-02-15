// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/cart.dart';
import 'package:project_signin_firebase/fevorate.dart';
import 'package:project_signin_firebase/home.dart';
import 'package:project_signin_firebase/services/google_service.dart';
import 'package:project_signin_firebase/sigle_product.dart';
import 'package:project_signin_firebase/sigle_product2.dart';
import 'package:project_signin_firebase/signIn.dart';
import 'package:project_signin_firebase/signup.dart';
import 'package:project_signin_firebase/view_all/allproduct.dart';
import 'package:project_signin_firebase/view_all/child_condition.dart';
import 'package:project_signin_firebase/view_all/ready_to_cook.dart';
import 'package:project_signin_firebase/view_all/vegeCategory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBcsLc8cHnJuBwkKa1EZj1k-D48t_mF5Vc",
      appId: "1:717854214894:android:fdca502bb908415f53c1ff",
      messagingSenderId: "717854214894",
      projectId: "project-signin-firebase",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUp();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    String? token = await authClass.getToken();
    if (token != null) {
      setState(() {
        currentPage = Newpage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      // RTCviewAll(),
      // SingleProduct(),
      // CartClass(),
      // ProductCategory(),
      // AllProductView()
      
      currentPage,
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => Newpage(),
        '/signin': (context) => ClassSignIn(),
        '/signup': (context) => SignUp(),
        '/readytocook' : (context) => RTCviewAll(),
        '/childCondition' : (context) => CCviewAll(),
        '/singleProductView' : (context) => SingleProduct(),
        '/singleProductView2' : (context) => SingleProduct2(),
        '/cart' : (context) => CartClass(),
        '/favorite' : (context) => FavoriteClass(),
        '/product' : (context) => AllProductView(),
      },
    );
  }
}
