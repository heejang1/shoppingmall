import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ittierra_app/Account/model/user_model.dart';
import 'package:ittierra_app/Account/screen/preference/preference_screen.dart';
import 'package:ittierra_app/Account/screen/update/update_screen.dart';
import 'package:transition/transition.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("My Page"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
        centerTitle: true,
        //우측 아이콘 표시
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    Transition(
                        child: const Preference(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
              },
              child: const CircleAvatar(
                child: Icon(Icons.settings, size: 26.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 180,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.account_circle,
                      size: 120, color: Colors.white),
                ),
              ),
              Text(
                "${loggedInUser.name}님",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${loggedInUser.email}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        Transition(
                            child: const Update(),
                            transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                  },
                  child: const Text("정보수정")),
              // ClipOval(
              //   child: Material(
              //     color: Colors.black,
              //     child: InkWell(
              //       child: const SizedBox(
              //           width: 56,
              //           height: 56,
              //           child: Icon(Icons.settings,
              //               color: Colors.white, size: 30)),
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             Transition(
              //                 child: const Update(),
              //                 transitionEffect:
              //                     TransitionEffect.RIGHT_TO_LEFT));
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 4),
              // const Text("정보수정"),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
