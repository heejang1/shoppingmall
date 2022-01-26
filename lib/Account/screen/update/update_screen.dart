import 'package:flutter/material.dart';
import 'package:ittierra_app/Account/model/reauth_arg.dart';
import 'package:ittierra_app/Account/screen/update/reauth.dart';

class Update extends StatelessWidget {
  const Update({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("정보수정"),
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
              title: const Text('이메일 변경'),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, ReAuth.routeName,
                    arguments: ReAuthArguments('이메일 변경', 'UpdateEmail'));
              },
            ),
            ListTile(
              title: const Text('비밀번호 변경'),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, ReAuth.routeName,
                    arguments: ReAuthArguments('비밀번호 변경', 'UpdatePassword'));
              },
              // onTap: () async {
              //   Navigator.of(context).push(Transition(
              //       child: const ReAuthenticate(),
              //       transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
              // },
            ),
          ],
        ),
      ),
    );
  }
}
