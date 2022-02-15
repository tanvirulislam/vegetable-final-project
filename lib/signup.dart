// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_signin_firebase/services/google_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final auth = FirebaseAuth.instance;

  AuthClass authClass = AuthClass();

  Widget buttonItem(String imagePath, String buttonName, Function onTap) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imagePath),
            Text(
              buttonName,
              style: TextStyle(
                fontSize: 16,
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textItem(
      String textLabel, bool secureText, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        // style: TextStyle(
        //   color: Colors.white,
        // ),
        decoration: InputDecoration(
          // labelText: 'Name',

          hintText: textLabel,
          // hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Sign up',
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await authClass.handleSignIn(context);
                },
                child: buttonItem('assets/google.png', 'Continue with google',
                    () async {
                  await authClass.handleSignIn(context);
                }),
              ),
              SizedBox(
                height: 10,
              ),
              // buttonItem('assets/phone.png', 'Continue with phone', () {}),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'OR',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              textItem('Email', false, _emailController),
              SizedBox(
                height: 10,
              ),
              textItem('Password', true, _passController),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passController.text,
                    );
                    Navigator.pushNamed(context, '/welcome');
                  } catch (e) {
                    final snackBar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 150,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Colors.lightBlue,
                        Colors.green,
                        Colors.lightBlue,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   // ignore: prefer_const_literals_to_create_immutables
              //   children: [
              //     Text(
              //       'If you r already have an account?',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 4,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, '/signin');
              //       },
              //       child: Text(
              //         'Login',
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
