import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/model/regular_expression.dart';
import 'package:ittierra_app/Account/model/user_model.dart';

import '../../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _cPasswordFocus = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("이름을 입력해주세요");
        }
        if (!RegularExpression().regExpNa.hasMatch(value)) {
          return ("이름은 2글자 이상 입력가능합니다");
        }
        return null;
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _nameFocus,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "이름",
          helperText: "이름을 입력해주세요.",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10))),
    );

    final emailField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "이메일을 입력해주세요.";
        } else {
          if (!RegularExpression().regExpEm.hasMatch(value)) {
            return "이메일 형식에 맞지 않습니다.";
          }
          return null;
        }
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _emailFocus,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "이메일",
          helperText: "이메일을 입력해주세요."),
    );

    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: passwordController,
      obscureText: true,
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
      focusNode: _passwordFocus,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
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
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "비밀번호를 입력해주세요.";
        }
        if (cPasswordController.text != passwordController.text) {
          return "비밀번호가 일치하지 않습니다.";
        }
        return null;
      },
      onSaved: (value) {
        cPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _cPasswordFocus,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
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

    final signUpBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          regist(emailController.text, passwordController.text);
        },
        child: const Text(
          '회원가입',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
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
                      const SizedBox(height: 8),
                      nameField,
                      const SizedBox(height: 8),
                      emailField,
                      const SizedBox(height: 8),
                      passwordField,
                      const SizedBox(height: 8),
                      cPasswordField,
                      const SizedBox(height: 15),
                      signUpBtn,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void regist(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async {
    //calling Firestore
    //calling UserModel
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "회원가입을 축하합니다. :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => const App()), (route) => false);
  }
}
