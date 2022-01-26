import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/model/firebase_service.dart';
import 'package:ittierra_app/Account/model/regular_expression.dart';

import '../../../main.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  // 비밀번호 보이기 안보이기
  bool _invisible = true;
  bool _cinvisible = true;

  void _toggle() {
    setState(() {
      _invisible = !_invisible;
    });
  }
  void _ctoggle() {
    setState(() {
      _cinvisible = !_cinvisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: passwordController,
      obscureText: _invisible,
      validator: (value) {
        if (value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if (!RegularExpression().regExpPw.hasMatch(value)) {
          return '6글자 이상 입력해주세요.';
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: passwordController.clear,
          icon: Icon(Icons.cancel,
              color: passwordController.text.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "비밀번호",
        helperText: "특수문자, 대소문자, 숫자 포함 8 ~ 15자로 입력하세요.",
      ),
    );

    final cPasswordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: cPasswordController,
      obscureText: _invisible,
      validator: (value) {
        if (value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if (!RegularExpression().regExpPw.hasMatch(value)) {
          return '6글자 이상 입력해주세요.';
        }
        if (passwordController.text != cPasswordController.text) {
          return '비밀번호가 일치하지않습니다.';
        }
      },
      onSaved: (value) {
        cPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: cPasswordController.clear,
          icon: Icon(Icons.cancel,
              color: cPasswordController.text.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "비밀번호 확인",
        helperText: "비밀번호를 다시 한번 입력해주세요.",
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
            await AuthService()
                .updatePassword(passwordController.text)
                .then((uid) => {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) => const App()),
                      (route) => false)
            })
                .catchError((e) {
              Fluttertoast.showToast(msg: e!.message);
            });
          }
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
          title: const Text("비밀번호 변경"),
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
                    const SizedBox(height: 10),
                    cPasswordField,
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _ctoggle,
                          child: Icon(
                            _cinvisible
                                ? Icons.check_box_outline_blank
                                : Icons.check_box_outlined,
                            size: 24,
                          ),
                        ),
                        GestureDetector(
                          onTap: _ctoggle,
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