import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ittierra_app/Account/model/user_model.dart';
import '../../Home.dart';

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

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final cPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value)
      {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _nameFocus,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "이름",
        helperText: "이름을 입력해주세요.",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
    final emailField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return "이메일을 입력하세요.";
        } else {
          if(!RegExp(
              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"
          ).hasMatch(value)) {
            return "이메일 형식에 맞지 않습니다.";
          }
          return null;
        }
      },
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _emailFocus,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.black,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10)
          ),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "이메일",
        helperText: "이메일을 입력해주세요."
      ),
    );
    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value){
        RegExp regex = RegExp(r'^.{6,}$');
        if(value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if(!regex.hasMatch(value)) {
          return '6자 이상 입력해주세요.';
        }
      },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocus,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10)
          ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "비밀번호",
        helperText: "특수문자, 대소문자, 숫자 포함 8자이상 15자 이내로 입력하세요.",
      ),
    );
    final cPasswordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: cPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(cPasswordEditingController.text != passwordEditingController.text){
          return "비밀번호가 일치하지 않습니다.";
        }
        return null;
      },
      onSaved: (value)
      {
        cPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      focusNode: _cPasswordFocus,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10)
          ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "비밀번호 확인",
        helperText: "비밀번호를 다시 한번 입력해주세요.",
      ),
    );
    final signUpBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          regist(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text('Sign Up', textAlign: TextAlign.center,
        ),
        textColor: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
      ),
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
                    SizedBox(
                        height: 8
                    ),
                    nameField,
                    SizedBox(
                        height: 8
                    ),
                    emailField,
                    SizedBox(
                        height: 8
                    ),
                    passwordField,
                    SizedBox(
                        height: 8
                    ),
                    cPasswordField,
                    SizedBox(
                        height: 15
                    ),
                    signUpBtn,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void regist(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFireStore()
          }).catchError((e){
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
    userModel.name = nameEditingController.text;

    await firebaseFirestore
      .collection("Users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "회원가입을 축하합니다. :) ");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context)=>Home()),
            (route) => false
    );

  }
}
