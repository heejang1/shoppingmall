import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/model/reauth_arg.dart';
import 'package:ittierra_app/Account/screen/update/reauth.dart';

import '../../../../main.dart';

class Preference extends StatefulWidget {
  const Preference({Key? key}) : super(key: key);

  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("설정"),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          // 스크롤 금지
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListTile(
              title: const Text('로그아웃'),
              onTap: () {
                logoutConfirm(context);
              },
            ),
            ListTile(
              title: const Text('탈퇴하기'),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () async {
                // deleteConfirm(context);
                // Navigator.push(
                //     context,
                //     Transition(
                //         child: const ReAuthenticate(),
                //         transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                  Navigator.pushNamed(context, ReAuth.routeName,
                      arguments: ReAuthArguments('회원탈퇴', 'deleteUser'));
              },
            ),
          ],
        ),
      ),
    );
  }

  void logoutConfirm(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: const Text("\n로그아웃 하시겠습니까?",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),

        actions: [
          const Divider(color: Colors.black12, thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 60),
              TextButton(
                child: const Text("로그아웃",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await _auth.signOut();
                  Fluttertoast.showToast(msg: "로그아웃했습니다.");
                  goMain(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void deleteConfirm(context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: const Text("정말로 탈퇴 하시겠습니까?", textAlign: TextAlign.center),
  //       actions: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             TextButton(
  //               child: const Text("네"),
  //               onPressed: () async {
  //                 await user
  //                     ?.delete()
  //                     .then((value) => goMain(context))
  //                     .catchError((e) {
  //                   Fluttertoast.showToast(msg: e!.message);
  //                 });
  //               },
  //             ),
  //             const SizedBox(width: 60),
  //             TextButton(
  //               child: const Text("아니오"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void goMain(context) {
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => const App()), (route) => false);
  }
}
