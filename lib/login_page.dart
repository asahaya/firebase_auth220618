import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth220618/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCon = TextEditingController();
  final passCon = TextEditingController();

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 40,
        ),
        TextField(
          controller: emailCon,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 40),
        TextField(
          controller: passCon,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Passeord'),
        ),
        SizedBox(  height: 5 ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            onPressed: signIn,
            icon: Icon(Icons.lock_open, size: 32),
            label: Text(
              'Sign In',
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 24),
            RichText(text: TextSpan(style: TextStyle(color: Colors.white,fontSize: 20),
            text: 'No Account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap=
              )
            ]
            ))
      ]),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCon.text.trim(),
        password: passCon.text.trim(),
      );
    } on FirebaseAuthException catch (eee) {
      print("=----------${eee}");
      Center(
        child: Text(eee.toString()),
      );
    }
    NavigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
