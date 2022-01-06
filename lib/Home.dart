import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ittierra_app/Account/model/user_model.dart';
import 'Account/screen/Login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user?.uid)
        .get()
        .then((value){
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCENTSAY'),
        backgroundColor: Colors.black,
        actions: [
          IconButton( //로그인 버튼
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn()));
            },
          )
        ],
      ),
      body: Center(
        child: BottomBar(),
      ),
    );
  }
  //로그아웃 함수
  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context)=>LogIn()));
  // }
}

