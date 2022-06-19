import 'package:firebase_auth220618/login_page.dart';
import 'package:firebase_auth220618/singup_page.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(onClickedSignUp: toggle)
        : SignUpPage(onClickedSignIn: toggle);
  }

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
