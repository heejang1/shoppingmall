import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ittierra_app/Account/screen/LoginTab.dart';
import 'package:ittierra_app/Account/screen/MyPage.dart';

class IsLogin extends StatefulWidget {
  const IsLogin({Key? key}) : super(key: key);

  @override
  _IsLoginState createState() => _IsLoginState();
}

class _IsLoginState extends State<IsLogin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyPage();
        } else {
          return LoginTab();
        }
      },
    );
  }
}
