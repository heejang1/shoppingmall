import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/model/firebase_service.dart';
import 'package:ittierra_app/Account/model/reauth_arg.dart';
import 'package:ittierra_app/Account/screen/update/update_email.dart';
import 'package:ittierra_app/Account/screen/update/update_password.dart';

import '../../../main.dart';

class ReAuth extends StatefulWidget {
  const ReAuth({Key? key}) : super(key: key);

  static const String routeName = "/ReAuth";

  @override
  _ReAuthState createState() => _ReAuthState();
}

class _ReAuthState extends State<ReAuth> {
  User? user = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

// 비밀번호 보이기 안보이기
  bool _invisible = true;

  void _toggle() {
    setState(() {
      _invisible = !_invisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ReAuthArguments;

    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: passwordController,
      obscureText: _invisible,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("비밀번호를 입력해주세요.");
        }

        if (!regex.hasMatch(value)) {
          return ("6자 이상 입력해주세요.");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: passwordController.clear,
          icon: Icon(Icons.cancel,
              color: passwordController.text.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "비밀번호",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );

    final confirmBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var email = user!.email;
            if (args.select == "UpdateEmail") {
              await AuthService()
                  .reAuthCredential(email!, passwordController.text)
                  .then((uid) => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UpdateEmail()))
                      })
                  .catchError((e) {
                Fluttertoast.showToast(msg: e!.message);
              });
            }
            if (args.select == "UpdatePassword") {
              await AuthService()
                  .reAuthCredential(email!, passwordController.text)
                  .then((uid) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UpdatePassword()))
              })
                  .catchError((e) {
                Fluttertoast.showToast(msg: e!.message);
              });
            }
            if (args.select == "deleteUser") {
              await AuthService()
                  .reAuthCredential(email!, passwordController.text)
                  .catchError((e) {
                Fluttertoast.showToast(msg: e!.message);
              });
              await AuthService()
                  .deleteUser()
                  .then((uid) => {
                        Navigator.pushAndRemoveUntil((context), MaterialPageRoute(
                            builder: (context) => const App()), (route) => false)
                      })
                  .catchError((e) {
                Fluttertoast.showToast(msg: e!.message);
              });
            }
          }
          // if (user != null) {
          //   var email = user!.email;
          //   await AuthService()
          //       .deleteUser(email!, passwordController.text)
          //       .then((uid) => {
          //             Fluttertoast.showToast(msg: "정상적으로 탈퇴되었습니다."),
          //             Navigator.of(context).pushReplacement(
          //                 MaterialPageRoute(builder: (context) => const App())),
          //           })
          //       .catchError((e) {
          //     Fluttertoast.showToast(msg: e!.message);
          //   });
          // }
        },
        child: const Text(
          '확 인',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(args.title),
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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      "비밀번호를 입력해주세요",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    passwordField,
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            _invisible
                                ? Icons.check_box_outline_blank
                                : Icons.check_box_outlined,
                            size: 24,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggle,
                          child: const Text(" 비밀번호 보기"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    confirmBtn,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
