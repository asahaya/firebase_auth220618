import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth220618/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          FlutterLogo(size: 120),
          SizedBox(height: 20),
          Text(
            'Hey There ,\n Welcome Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          TextField(
            controller: emailCon,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 4),
          TextField(
            controller: passCon,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: signUp,
            icon: Icon(Icons.arrow_right),
            label: Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
          ),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  text: 'Already have an account? ',
                  children: [
                TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ]))
        ],
      ),
    );
  }

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCon.text.trim(),
        password: passCon.text.trim(),
      );
    } on FirebaseAuthException catch (eee) {
      print(eee);
    }
    NavigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
