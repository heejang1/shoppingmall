import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/screen/reset_password.dart';

import '../../main.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  // 비밀번호 보이기 안보이기
  bool _invisible = true;

  void _toggle() {
    setState(() {
      _invisible = !_invisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;

    final emailField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 18,
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "이메일을 입력하세요.";
        } else {
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "이메일 형식에 맞지 않습니다.";
          }
          return null;
        }
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        // 내용 지우기
        suffixIcon: IconButton(
          onPressed: _emailController.clear,
          icon: Icon(Icons.cancel,
              color: _emailController.text.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText: "이메일",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );

    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 18,
      autofocus: false,
      controller: _passwordController,
      obscureText: _invisible,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if (!regex.hasMatch(value)) {
          return '6자 이상 입력해주세요.';
        }
      },
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        // 텍스트 필드 좌측 자물쇠 아이콘
        prefixIcon: const Icon(Icons.lock),
        // 내용 지우기
        suffixIcon: IconButton(
          onPressed: _passwordController.clear,
          icon: Icon(Icons.cancel,
              color: _passwordController.text.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent),
        ),
        // 비밀번호 보기/안보기
        // suffixIcon: Padding(
        //   padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        //   child: GestureDetector(
        //     onTap: _toggle,
        //     child: Icon(
        //       _invisible
        //           ? Icons.visibility_rounded
        //           : Icons.visibility_off_rounded,
        //       size: 24,
        //     ),
        //   ),
        // ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText: "비밀번호",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );

    // final loginBtn = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Colors.black,
    //   child: MaterialButton(
    //     padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     minWidth: MediaQuery.of(context).size.width,
    //     onPressed: () {
    //       signIn(_emailController.text, _passwordController.text);
    //     },
    //     child: const Text(
    //       'Log In',
    //       textAlign: TextAlign.center,
    //     ),
    //     textColor: Colors.white,
    //   ),
    // );

    final loginBtn = ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ElevatedButton(
        onPressed: () {
          signIn(_emailController.text, _passwordController.text);
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          primary: Colors.black,
          minimumSize: Size(screenSize, 40),
        ),
        child: const Text(
          "로그인",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    // 빈 화면 터치시 키보드 내리기
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Text(
                      'SCENTSAY',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    const SizedBox(height: 26),
                    emailField,
                    const SizedBox(height: 8),
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
                    loginBtn,
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // const Text('계정이 없으신가요? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPwd()));
                          },
                          child: const Text(
                            "비밀번호 찾기",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "성공적으로 로그인 되었습니다."),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const App())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
