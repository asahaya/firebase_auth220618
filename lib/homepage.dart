import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Column(children: [
        Text(
          'signed In As',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          user.email!,
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 32,
            ),
            label: Text(
              'Sign Out',
              style: TextStyle(fontSize: 24),
            )),
      ]),
    );
  }
}
